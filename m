Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330D7C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 12:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D528164B;
	Mon, 31 Jul 2023 12:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D528164B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=RebDnHcg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VyuhboXAaunl; Mon, 31 Jul 2023 12:37:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 877428164A;
	Mon, 31 Jul 2023 12:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 877428164A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F1CFC0072;
	Mon, 31 Jul 2023 12:37:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0016C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 12:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2C4640207
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 12:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C4640207
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=RebDnHcg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kf-808TX_ThK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 12:37:52 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A97AD4016D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 12:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A97AD4016D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690807063; x=1691411863; i=deller@gmx.de;
 bh=Ms/avEkI75OIEgYMCo/ytKRctnQrgMl6JO+Gl0Gsf3w=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RebDnHcgL27HOM7ubal87JY21pjQAIdbgHQII3yFaR5CGhUtnu+USUcXNQGKl44Jm3YzXW6
 MvuHC+Qa8QdqdwmOasFYXs9uNTLT0SF2BdetuFEKBVFpxcTCLzyS0TufboynGOKp6T1s48WLb
 w58lW1DBGCQKk4KC5Qz9yhUCkvdOUDVV7cxzb1ErBKKn/rGMNvBWAyhbYvzDZJQ3dJn656bVE
 q6znwxxttioVC5UHbT6RECAyk/rPsjgj25NaamF69w/9CUU+Z1b4DUSnU5m9YPam5t8yrpqXr
 9nRohZDNxbB0RwNjiKS80hl4SWcRchatB954G7lxqrcaL1t1h0VQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.238]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1qGaod0KTE-00Rbnx; Mon, 31
 Jul 2023 14:37:43 +0200
Message-ID: <76b3c602-ab9d-7368-2c83-f5a8f4f0f330@gmx.de>
Date: Mon, 31 Jul 2023 14:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fbdev/amifb: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Content-Language: en-US
To: Atul Raut <rauji.raut@gmail.com>
References: <20230731021808.24997-1-rauji.raut@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230731021808.24997-1-rauji.raut@gmail.com>
X-Provags-ID: V03:K1:f/tCxU4mR2FSkwyxg/Pz1S54l9RKyiB9xbF6exUuGYhXcj3zYKL
 rUUcpgrq4tx8L+3f+/jpbi8QYi1L7ah575zv5Dw2aomoFeVmZmPoZmqJ0XlPb2GOBd5yEkn
 t+avf4l8Exyi+PZIQko4SQXR3gwj7AU4ssMhbyzSFK8aILd1e+wxGhvVsFReettVkPwT1n5
 MkuFm60XSmKCbmHefRwmg==
UI-OutboundReport: notjunk:1;M01:P0:7h3/yL6t/qk=;+J46rFQhxCOAdSskQUGZ+gnmBGC
 dVBvHoqWyyTn0IjIia/X5UrDziZjViqhLXA4ZJbaNdral0IGCd+HcuKsPq1XjRC66wKjbsaFq
 vLCCZwzJzPYV8FWVzkzjop8YGbWZyZCYqha599kevSG0g9xX30OTyK0TrrVXkqmPSSuflkcLl
 uBVSBDr+B4i8VIsUbptEITjyFoj0oPhe9Jq3NEA0Upj/tI4CvE0FU6xBBEae7dp2fQZHi+PS3
 /G/bgTMYAp8CpxVzogZG27o0ETM/doRFn8/FhCUjRovSQpXqoSeXUZ4VuVzFoO8QWUCo+sQVM
 e1GudTgpHngilR5ayD6hKEZMnuGfWLMjqwsD3QrW5Jg/kAOnlr7E38k4OJhD++iJXpc2Hc+2W
 EnxvLp0riV+2uPxd5SOR1L2dXo0mA6E7MMUPTGGfHJAWPABHgKUqExzGv3YGeN9yN2iMyW2Wq
 qG/HZ9R44CEdMG1DkdiM8B0fTI7k+OPukX8hxfCFEya8Pl6d3WUKOWvfpPmfgwcssQhqrqs2b
 aUzS5GI0hutNwiBXf/Gs2jyCYhvGo+LXtO+dVglnpHEwgcluA2xuVC4LG6tqbF0GEgoaQgryZ
 Qufb79yjzLR+6SDp3uHLtQZxv4xknJVmI97eR6tvOugRadzcDOClulFaXPsALJxML2+3MF1YB
 iPLJbtU0C83K9A+9EGp+VgC1tKSAuR0mo/+Xpq4ZPq4V8bKdYrKDs2eGjzIxQw2RUPwbNqkkI
 TBqv7sXGuoNQv3JDHYYt+jEpOax0cUkSkho9KsgG2vWo9qkzAr72aMmosLSSBzGpbSUZZy+pH
 5I/lAO6cL1c1koENnUoqfELQi8PxZF5v3rcAsfpspeP1/uL/6EzDZ2w+ouQxQ/wHrh2BTSvdI
 wlcfRWOHj87hQedfAEeXnp3M9e+fWLXiwJiiMpX/3deBv4cTfJaa10+twJoIganjCj7gTRL2F
 UuSifw==
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 7/31/23 04:18, Atul Raut wrote:
> Replacing zero-length arrays with C99 flexible-array members
> because they are deprecated. Use the new DECLARE_FLEX_ARRAY()
> auxiliary macro instead of defining a zero-length array.
>
> This fixes warnings such as:
> ./drivers/video/fbdev/amifb.c:690:6-10: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>

applied.
Thanks!
Helge

> ---
>   drivers/video/fbdev/amifb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
> index d88265dbebf4..f216b2c702a1 100644
> --- a/drivers/video/fbdev/amifb.c
> +++ b/drivers/video/fbdev/amifb.c
> @@ -687,7 +687,7 @@ struct fb_var_cursorinfo {
>   	__u16 height;
>   	__u16 xspot;
>   	__u16 yspot;
> -	__u8 data[1];			/* field with [height][width]        */
> +	DECLARE_FLEX_ARRAY(__u8, data);	/* field with [height][width]        */
>   };
>
>   struct fb_cursorstate {

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
