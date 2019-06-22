From: gregkh@linuxfoundation.org (Greg KH)
Date: Sat, 22 Jun 2019 09:29:04 +0200
Subject: [Linux-kernel-mentees] [PATCH v2] replaced both the symbolic
 permissions S_IXUGO and S_IRUGO to octal permissions 0111 and 0444
In-Reply-To: <20190622071703.9664-1-sushmaunnibhavi425@gmail.com>
References: <20190622071703.9664-1-sushmaunnibhavi425@gmail.com>
Message-ID: <20190622072904.GA9498@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190622072904.jOJIUbjeivTJ40Kor3zw-7aWpTa89uBszaUcYTednSM@z>

On Sat, Jun 22, 2019 at 12:47:03PM +0530, Sushma Unnibhavi wrote:
> Signed-off-by: Sushma Unnibhavi <sushmaunnibhavi425 at gmail.com>
> ---
> Changes in v2:changed both symbolic permissions to octal
>  drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'm just going to delete this and wait for a new set on Monday :)

thanks,

greg k-h
