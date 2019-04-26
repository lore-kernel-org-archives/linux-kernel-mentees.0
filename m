From: skhan at linuxfoundation.org (Shuah Khan)
Date: Fri, 26 Apr 2019 12:54:13 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] staging: rtl8723bs: Fix
	checkpatch.pl warnings
In-Reply-To: <20190426174025.19901-1-bnvandana@gmail.com>
References: <20190426131249.16198-1-bnvandana@gmail.com>
	<20190426174025.19901-1-bnvandana@gmail.com>
Message-ID: <c42dfa4d-6a4f-f563-4be8-a8123039dc63@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 4/26/19 11:40 AM, Vandana BN wrote:
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
>   drivers/staging/rtl8723bs/core/rtw_debug.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
> index 0de1e12a676e..3fb09ad45a67 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_debug.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
> @@ -1425,9 +1425,8 @@ int proc_get_btcoex_info(struct seq_file *m, void *v)
>   	padapter = (struct adapter *)rtw_netdev_priv(dev);
>   
>   	pbuf = rtw_zmalloc(bufsize);
> -	if (NULL == pbuf) {
> +	if (pbuf == NULL)
>   		return -ENOMEM;
> -	}
>   
>   	rtw_btcoex_DisplayBtCoexInfo(padapter, pbuf, bufsize);
>   
> 

Please make the changes to improve the commit log. State what you are
changing.

Please go ahead and the patch to the everybody getmaintainers.pl
suggests and cc me and linux-kernel-mentees at list.linuxfoundation.org

The same as above for your future patches.

thanks,
-- Shuah
