Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB63B182
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 05:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478309; cv=none; b=MKRJsMUtpgqhkVe+T7B9NNVKT/ZeuR8T9TCaJ8BQrmYTQSex2N8P0hNEY4M5Dt6IuL+26AtGT8NAGyoXX/gt/8t5a+HmLGkEf68nWqWUzCop6Gp+BzJShyPdCbo2bFJCGjREhjFf2wIGHu7FwvknKD/d7VzPxk9bv6fx4oq5YhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478309; c=relaxed/simple;
	bh=17296TZIkNThf8+jO89AL+ryDKa+Dvu6bh33utavEpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZ0F1HqpOji+3f02zvyGAbo2Izyu4kd5VQiSuNSvuc0FH+x7Upz096WfdR+PqDE6bLXsq+ovclssSovHQu8DwbMXlUDR2SNq3VcbwyxYhHlY59KzR8exLQPAASlM2wE9N6HbU2X5tQFBrTBGL0CCgZfhFNq4S4KmToN+8MGHcCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iIf+byh4; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iIf+byh4"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0665280D48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 05:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTnRmpReEyNb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Aug 2024 05:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB85380D41
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB85380D41
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=iIf+byh4
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CB85380D41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 05:45:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B157B6114A;
	Sat, 24 Aug 2024 05:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CA2C32781;
	Sat, 24 Aug 2024 05:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724478304;
	bh=17296TZIkNThf8+jO89AL+ryDKa+Dvu6bh33utavEpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIf+byh4C/FEh6AyXTjbsFjiXdOtcg6N34CYO3DtejP0WrkAPMTJfbT+2LlhRQ5sy
	 fpW7V75/w5smkSqv6LdxdlA5VOU1xVLwwFYgW+nY1jYCkE8NV8fQGWgSSLIhy61d9u
	 0MgmnJwFcRF51a/9KK97ARSJgGFfIRr/0RDHoFlM=
Date: Sat, 24 Aug 2024 13:45:00 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: tdavies@darkphysics.net, philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	dan.carpenter@linaro.org, christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in
 rtl819x_translate_scan
Message-ID: <2024082430-unlatch-antennae-0ea7@gregkh>
References: <20240823153411.74142-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823153411.74142-1-abhishektamboli9@gmail.com>

On Fri, Aug 23, 2024 at 09:04:11PM +0530, Abhishek Tamboli wrote:
> Replace strcpy() with strcat() in rtl819x_translate_scan()
> Also Fix proto_name[] buffer size issue to accommodate all
> network modes.

When you say "also" in a changelog text, that's a huge hint that this
should probably be split up into multiple changes.  Please do that here.

More comments below.

> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Revert the use of strscpy and replaced it with strcat.
> - Remove the 'pname' and replace it's usage with direct
> operations on 'proto_name' buffer.
> 
>  drivers/staging/rtl8192e/rtllib_wx.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index fbd4ec824084..ec0c4c5bade7 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
>  };
> 
>  #define MAX_CUSTOM_LEN 64
> +#define MAX_PROTO_NAME_LEN 10

Where did this "10" come from?  What sets this limit?  Why not 100?
1000?  2?  You get the idea :)


>  static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>  					   char *start, char *stop,
>  					   struct rtllib_network *network,
>  					   struct iw_request_info *info)
>  {
>  	char custom[MAX_CUSTOM_LEN];
> -	char proto_name[6];
> -	char *pname = proto_name;
> +	char proto_name[MAX_PROTO_NAME_LEN];
>  	char *p;
>  	struct iw_event iwe;
>  	int i, j;
> @@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>  	}
>  	/* Add the protocol name */
>  	iwe.cmd = SIOCGIWNAME;
> +	/* Initialise proto_name as an empty string*/
> +	memset(proto_name, '\0', sizeof(proto_name));
>  	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
> -		if (network->mode & BIT(i)) {
> -			strcpy(pname, rtllib_modes[i]);
> -			pname += strlen(rtllib_modes[i]);
> +		if (network->mode & BIT(i))
> +			strcat(proto_name, rtllib_modes[i]);
>  		}
> -	}

I think the } placement is now incorrect, right?  Did you run checkpatch
on this change?

thanks,

greg k-h
