<?php
declare(strict_types=1);

namespace Blog\Slim;


use Blog\Twig\AssetExtension;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;
use Twig\Environment;

class TwigMiddleware implements MiddlewareInterface
{
    /**
     * @var Environment
     */
    private Environment $enviroment;

    /**
     * TwigMiddleware constructor.
     * @param Environment $enviroment
     */
    public function __construct(Environment $enviroment)
    {
        $this->enviroment = $enviroment;
    }

    /**
     * @param ServerRequestInterface $request
     * @param RequestHandlerInterface $handler
     * @return ResponseInterface
     */
    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
    {
        $this->enviroment->addExtension(new AssetExtension($request));
        return $handler->handle($request);
    }
}