From: gregkh@linuxfoundation.org (Greg KH)
Date: Sat, 27 Apr 2019 08:31:18 +0200
Subject: [Linux-kernel-mentees] [PATCH v3] staging: rtl8723bs: Fix
	checkpatch.pl warnings
In-Reply-To: <20190427055020.23203-1-bnvandana@gmail.com>
References: <20190426131249.16198-1-bnvandana@gmail.com>
	<20190427055020.23203-1-bnvandana@gmail.com>
Message-ID: <20190427063118.GC15324@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190427063118.ot11v_dJFSw0CL8MvGJeAtY9Tu7yZAG6I4Mg59pK8Xo@z>

On Sat, Apr 27, 2019 at 11:20:20AM +0530, Vandana BN wrote:
> This patch resolves coding style brace warning and constant on right warning.
> WARNING: Comparisons should place the constant on the right side of the test
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Vandana BN <bnvandana at gmail.com>

I need a "real name" here, and in the From: line.  Unless I am mistaken
and your last name is just "BN" and that is how you sign legal
documents?  If so, please let me know.


> ------
>  v2- Edited commit message and subject
>  v3- Edited commit message
> ------
> ---
>  drivers/staging/rtl8723bs/core/rtw_debug.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
> index 0de1e12a676e..3fb09ad45a67 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_debug.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
> @@ -1425,9 +1425,8 @@ int proc_get_btcoex_info(struct seq_file *m, void *v)
>  	padapter = (struct adapter *)rtw_netdev_priv(dev);
>  
>  	pbuf = rtw_zmalloc(bufsize);
> -	if (NULL == pbuf) {
> +	if (pbuf == NULL)

checkpatch.pl was ok with this?  It didn't say to write this line
differently after you ran this patch through it?

thanks,

greg k-h
