From: hch at infradead.org (Christoph Hellwig)
Date: Mon, 17 Jun 2019 23:59:20 -0700
Subject: [Linux-kernel-mentees] [PATCH RESEND] fs: cramfs_fs.h: Fix
 shifting signed 32-bit value by 31 bits problem
In-Reply-To: <20190618041257.5401-1-puranjay12@gmail.com>
References: <20190618041257.5401-1-puranjay12@gmail.com>
Message-ID: <20190618065920.GA3620@infradead.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

> -#define CRAMFS_BLK_FLAG_UNCOMPRESSED	(1 << 31)
> +#define CRAMFS_BLK_FLAG_UNCOMPRESSED	(1U << 31)
>  #define CRAMFS_BLK_FLAG_DIRECT_PTR	(1 << 30)

Please use the unsigned constants for all flags, not just one.
