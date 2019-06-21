From: nico@fluxnic.net (Nicolas Pitre)
Date: Fri, 21 Jun 2019 11:40:38 -0400 (EDT)
Subject: [Linux-kernel-mentees] [PATCH v2 RESEND] fs: cramfs_fs.h: Fix
 shifting signed 32-bit value by 31 bits problem
In-Reply-To: <20190618163352.4177-1-puranjay12@gmail.com>
References: <20190618163352.4177-1-puranjay12@gmail.com>
Message-ID: <nycvar.YSQ.7.76.1906211139330.1558@knanqh.ubzr>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190621154038.Jc3B3SmacWtzl-J5IR15IEzlwmZTYs7MRWbZMlrKtss@z>

On Tue, 18 Jun 2019, Puranjay Mohan wrote:

> Fix CRAMFS_BLK_FLAG_UNCOMPRESSED to use "U" cast to avoid shifting signed
> 32-bit value by 31 bits problem. This isn't a problem for kernel builds
> with gcc.
> 
> This could be problem since this header is part of public API which
> could be included for builds using compilers that don't handle this
> condition safely resulting in undefined behavior.
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> Reviewed-by: Christoph Hellwig <hch at lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Reviewed-by: Shuah Khan <skhan at linuxfoundation.org>

Acked-by: Nicolas Pitre <nico at fluxnic.net>



> ---
> V2 - use the unsigned constants for all flags, not just one
> RESEND - Added Nicolas Pitre to CC list, added reviewed by tags.
> 
>  include/uapi/linux/cramfs_fs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/cramfs_fs.h b/include/uapi/linux/cramfs_fs.h
> index 6713669aa2ed..71cb602d4198 100644
> --- a/include/uapi/linux/cramfs_fs.h
> +++ b/include/uapi/linux/cramfs_fs.h
> @@ -98,8 +98,8 @@ struct cramfs_super {
>   *
>   * That leaves room for 3 flag bits in the block pointer table.
>   */
> -#define CRAMFS_BLK_FLAG_UNCOMPRESSED	(1 << 31)
> -#define CRAMFS_BLK_FLAG_DIRECT_PTR	(1 << 30)
> +#define CRAMFS_BLK_FLAG_UNCOMPRESSED	(1U << 31)
> +#define CRAMFS_BLK_FLAG_DIRECT_PTR	(1U << 30)
>  
>  #define CRAMFS_BLK_FLAGS	( CRAMFS_BLK_FLAG_UNCOMPRESSED \
>  				| CRAMFS_BLK_FLAG_DIRECT_PTR )
> -- 
> 2.21.0
> 
> 
