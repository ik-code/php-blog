<?php

use Blog\LatestPosts;
use Blog\Slim\TwigMiddleware;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use Twig\Environment;
use Twig\Loader\FilesystemLoader;
use Blog\PostMapper;


require __DIR__ . '/vendor/autoload.php';

$loader = new FilesystemLoader('templates');
$view = new  Environment($loader);



$config = include 'config/database.php';
$dsn = $config['dsn'];
$username = $config['username'];
$password = $config['password'];

try {
    $connection = new PDO($dsn, $username, $password);
    $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    // echo "Connected successfully";
} catch (PDOException $exception) {
    echo 'Database error: ' . $exception->getMessage();
    die();
}



// App - Slim Application
$app = AppFactory::create();

$app->add(new TwigMiddleware($view));

$app->get('/', function (Request $request, Response $response) use ($connection, $view) {

    $latestPosts = new LatestPosts($connection);

    $posts = $latestPosts->get(2);

    $body = $view->render('index.twig', [
        'posts' => $posts
    ]);
    $response->getBody()->write($body);
    return $response;
});

$app->get('/about', function (Request $request, Response $response) use ($view) {
    $body = $view->render('about.twig', [
        'name' => 'Igor',
        'lastname' => 'Khaletskyi'
    ]);
    $response->getBody()->write($body);
    return $response;
});

$app->get('/blog[/{page}]', function (Request $request, Response $response, $args) use ($connection, $view) {

    $postMapper = new PostMapper($connection);

    $page = isset($args['page'])? $args['page'] : 1;

    $limit = 2;

    $posts = $postMapper->getList( $page, $limit,'DESC' );

    $totalCount = $postMapper->getTotalCount();
    $body = $view->render('blog.twig', [
        'posts' => $posts,
        'pagination' => [
            'current' => $page,
            'paging' => ceil($totalCount / $limit),
        ],
    ]);
    $response->getBody()->write($body);
    return $response;
});

$app->get('/{url_key}', function (Request $request, Response $response, $args) use ($connection, $view) {

    $postMapper = new PostMapper($connection);

    $post = $postMapper->getByUrlKey((string)$args['url_key']);

    if (empty($post)) {
        $body = $view->render('not-found.twig');
    } else {
        $body = $view->render('post.twig', [
            'post' => $post
        ]);
    }

    $response->getBody()->write($body);
    return $response;
});


$app->run();