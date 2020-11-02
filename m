Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBF8C00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 07:43:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC3F21556
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 07:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANyFx2rc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BC3F21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C76548733C;
	Mon,  2 Nov 2020 07:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1eiBR7xRuJK; Mon,  2 Nov 2020 07:43:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F1196872C3;
	Mon,  2 Nov 2020 07:43:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB54FC0889;
	Mon,  2 Nov 2020 07:43:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26091C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0BBC886A91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZmPkvTWvCO9h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:43:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DDB4D86A90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:43:02 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l24so13338594edj.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 23:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=EizdTMSjsWrPEBP51dGJHW0A05HVcAn8m4B+WFJJMig=;
 b=ANyFx2rclHTUq6hP0lOqhX3OI60df3xfYCHnFzp5BuKP/3sE0WK2M+fiKYzN3rO82j
 P7lSTHdIFtnnWDxQ3CjHezAyw5xiaZbrFUeNBaHLGptZhQYl8/bae+1rTIDy2KtfRu0B
 gIthdMraEVkTVR1UYYw9un80U0FEspp70tKn1fHASZlFxy789yCTyQofUY+IY+rh/Y/H
 nNiTsX9y0/kGP7YbERnK9NmOL5f1qh0TiCIxI9WjHKcJymy48kJNaIcywl1UzDtGh5Ng
 LLTTnoF9qbgdXoPXu3lF9/Ej1mU4d0Q7ezPHMg3aTDGkHqR3pMoVTwyXpkviBjh+R3DF
 RwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=EizdTMSjsWrPEBP51dGJHW0A05HVcAn8m4B+WFJJMig=;
 b=hkDRwE40cx6HIQrbcKSlj9L5aOEDG+aK4olOef5XG/6c7eSLy/xu7nfPWkuI9KTwY9
 oWwTezxZwtrBgod6nH1oQs7xl3zNjzKsH2yi7W/YlT/apCilLJFe+yv7vHXWf/Cm3cQo
 7Q5D5z2FlgG0qc19sohAbcM7dbKTIt5OzTMtoZnSZMk4776+GkyqGZ3AwDP3cnWi+3Y/
 CUEm3SbhJWx5CXC35jGhCY9WfPPmkYli+hR1X3iU5hvlPJK6Gxudie68K650a46f6cKx
 lAzyYwPY7plkk8ip5fuzVOxUxjJbii4KV2S+CxHs6EN+EeZf9LykCOVLxxMKaOsCYzDM
 XeVQ==
X-Gm-Message-State: AOAM533+dWo93cX6GYjiFrZFX9TBRNItCL9eP1qBGDxT+mhT/abrI1Qs
 M85zTd+OL7vWiKWvJi4/3kM=
X-Google-Smtp-Source: ABdhPJxnwCn7MQ4w8hXX+eBNMpReVXXMLJHQ/FU97K+142RXWhoZUzd+eh4l5IqBuyDHx/hhukGMzQ==
X-Received: by 2002:a50:eb45:: with SMTP id z5mr15052943edp.144.1604302981227; 
 Sun, 01 Nov 2020 23:43:01 -0800 (PST)
Received: from felia ([2001:16b8:2d08:5700:a4fc:57d8:461e:80f1])
 by smtp.gmail.com with ESMTPSA id k22sm10212674edr.12.2020.11.01.23.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 23:43:00 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 2 Nov 2020 08:42:59 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <dd8349f6-f847-103c-f393-eabc4cc0101e@gmail.com>
Message-ID: <alpine.DEB.2.21.2011020833470.11801@felia>
References: <20201101182106.28568-1-yashsri421@gmail.com>
 <dd8349f6-f847-103c-f393-eabc4cc0101e@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	DEPRECATED_VARIABLE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On Mon, 2 Nov 2020, Aditya wrote:

> On 1/11/20 11:51 pm, Aditya Srivastava wrote:
> > The coding style of Makefile has been improved to use certain different
> > variable names as compared to earlier.
> > 
> > E.g., variable name asflags-y should be used instead of EXTRA_AFLAGS, etc
> > 
> > Currently checkpatch.pl warns the user to change variable name with
> > its corresponding upgrade, but does not have a fix option
> > 
> > Provide simple fix by substituting the variable name with its
> > corresponding upgrade.
> > 
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index a0107ed257d1..5fd34a862522 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3266,8 +3266,13 @@ sub process {
> >  				'EXTRA_LDFLAGS' =>  'ldflags-y',
> >  			};
> >  
> > -			WARN("DEPRECATED_VARIABLE",
> > -			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
> > +			if($replacement->{$flag}) {
> > +				if (WARN("DEPRECATED_VARIABLE",
> > +					 "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) &&
> > +				    $fix) {
> > +					$fixed[$fixlinenr] =~ s/$flag/$replacement->{$flag}/;
> > +				}
> > +			}
> >  		}
> >  
> >  # check for DT compatible documentation
> > 
> 
> For this warning, I couldn't find any warning in the past. So, I
> generated a patch for myself, for testing:
>

Well, but if we cannot find any warning in the past, I do not see the 
value of a fix. Who knows how developers would misuse the variable and if 
the simple replacement does not just break everything and makes things 
worse?

How about checking if documentation on this situation is available in the 
kernel documentation?

If so, maybe there are some hints that we could point out here for this 
rule?
I believe for some checkpatch rules it might be worth to point to more 
extensive documentation in the kernel documentation, so developers can 
read a bit more about specific rules.

And if not available, how about understanding the motivation and intent of 
this rule here and providing suitable documentation. That is a much better 
fix than just adding something to checkpatch.pl where we do not know if it 
is ever triggered and where we do not know if the fix makes the situation 
worse.

Lukas
 
> From 1bab609eae606a0b89aa6c752d07b0e64488a6e2 Mon Sep 17 00:00:00 2001
> From: Aditya Srivastava <yashsri421@gmail.com>
> Date: Sun, 1 Nov 2020 20:12:44 +0530
> Subject: [PATCH] makefile: testing
> 
> random description, random content
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/Makefile.lib | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 94133708889d..c9f50e2d9901 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -4,6 +4,7 @@ asflags-y  += $(EXTRA_AFLAGS)
>  ccflags-y  += $(EXTRA_CFLAGS)
>  cppflags-y += $(EXTRA_CPPFLAGS)
>  ldflags-y  += $(EXTRA_LDFLAGS)
> +EXTRA_LDFLAGS  = ldflags-y
>  ifneq ($(always),)
>  $(warning 'always' is deprecated. Please use 'always-y' instead)
>  always-y   += $(always)
> -- 
> 2.17.1
> 
> Running checkpatch.pl on it gives the warning:
> 
> WARNING: Use of EXTRA_LDFLAGS is deprecated, please use `ldflags-y
> instead.
> #21: FILE: scripts/Makefile.lib:7:
> +EXTRA_LDFLAGS  = cppflags-y
> 
> On executing it with --fix produces this result:
> 
> From 1bab609eae606a0b89aa6c752d07b0e64488a6e2 Mon Sep 17 00:00:00 2001
> From: Aditya Srivastava <yashsri421@gmail.com>
> Date: Sun, 1 Nov 2020 20:12:44 +0530
> Subject: [PATCH] makefile: testing
> 
> random description, random content
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/Makefile.lib | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 94133708889d..c9f50e2d9901 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -4,6 +4,7 @@ asflags-y  += $(EXTRA_AFLAGS)
>  ccflags-y  += $(EXTRA_CFLAGS)
>  cppflags-y += $(EXTRA_CPPFLAGS)
>  ldflags-y  += $(EXTRA_LDFLAGS)
> +ldflags-y  = cppflags-y
>  ifneq ($(always),)
>  $(warning 'always' is deprecated. Please use 'always-y' instead)
>  always-y   += $(always)
> -- 
> 2.17.1
> 
> 
> Here, the variable 'EXTRA_LDFLAGS' gets replaced with 'ldflags-y', as
> was suggested in the message.
> 
> 
> Thanks
> Aditya
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
