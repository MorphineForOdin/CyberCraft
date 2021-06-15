using System;

namespace TechMarket.API.Infrastructure.Common
{
    public static class ObjectExtensions
    {
        public static TSource Apply<TSource>(this TSource source, Func<TSource, TSource> functor)
            => functor(source);

        public static TSource Switch<TSource>(
            this TSource source,
            Func<TSource, bool> predicate,
            Func<TSource, TSource> success,
            Func<TSource, TSource> failure)
            => predicate(source) ? success(source) : failure(source);
    }
}