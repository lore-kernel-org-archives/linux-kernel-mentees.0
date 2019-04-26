From: linux.bhar@gmail.com (Bharath Vedartham)
Date: Fri, 26 Apr 2019 23:38:41 +0530
Subject: [Linux-kernel-mentees] [PATCH v2] staging: rtl8723bs: Fix
 checkpatch.pl warnings
In-Reply-To: <20190426174025.19901-1-bnvandana@gmail.com>
References: <20190426131249.16198-1-bnvandana@gmail.com>
	<20190426174025.19901-1-bnvandana@gmail.com>
Message-ID: <20190426180840.GA5560@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426180841.WRVFTTRbdvLc_ywMN9W2ON3Uv805-OP2PM_TKquN6pw@z>

On Fri, Apr 26, 2019 at 11:10:25PM +0530, Vandana BN wrote:
> fixed below warnings,
> Comparisons should place the constant on the right side of the test
> braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Vandana BN <bnvandana at gmail.com>
> 
> ------
> v2- Edited commit message and subject
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
>  		return -ENOMEM;
> -	}
>  
>  	rtw_btcoex_DisplayBtCoexInfo(padapter, pbuf, bufsize);
>  
> -- 
> 2.17.1
>
Hey!

Your patch subject should briefly describe the changes you are making.
It should not be very generic like "fix checkpatch.pl warnings" or "fix
sparse warnings". 

A good subject would be:
"Place constant on the right" 

In your changelog, you can mention the fact that this is a checkpatch.pl
warning. Something like: 
"This patch fixes the checkpatch.pl warning:
<Whatever the warning was>
"

Read this before submitting your patch: 
https://kernelnewbies.org/PatchPhilosophy

This is a great place to begin your patches journey!:
https://kernelnewbies.org/Outreachyfirstpatch

And also did you send this to the appropriate mailing lists?

Use ./scripts/get_maintainer.pl to get the maintainer and mailing list
to send this patch to. You ll be sending your patch to Greg again :p as
he maintains the staging branch.

Bharath



> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees at lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
