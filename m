Return-Path: <SRS0=Q14B=L3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B623EC07E97
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Jul 2021 09:47:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5005461451
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Jul 2021 09:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5005461451
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 183584029B;
	Sat,  3 Jul 2021 09:47:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRMaQCBb5qfK; Sat,  3 Jul 2021 09:47:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3D8D840171;
	Sat,  3 Jul 2021 09:47:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14E5CC0010;
	Sat,  3 Jul 2021 09:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD51BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 09:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B547B4242F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 09:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIK1j90kzLLR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 09:47:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A006F423DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Jul 2021 09:47:18 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id w15so12432835pgk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Jul 2021 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cKjvdxPILk0jm57SrpZOSRJWB+g7msED20iGZuVWYfc=;
 b=UM3nM1mnsIkJk3aZU+U6uaD+DpDJAJ1EAA6rVOej4EoXVRpl6BHnuRXSCGHqrkDUCR
 tkrH6s5iGqK4qbD+uKvTfvaqgXT8uaVy1WA8oZo6tA4H3ciuhOfsBVGZb3y629yEQcGa
 glZko7THKT4ILDRLHFiILlNIylLaqoYji6U+WgYdqbpqDNiEUnsWrXpWyOwT4OlHCJRQ
 jZGF+xYh0rR81Y8kPpmk63C5I6uy5VoAuSBmwNJqQ0OYCMNEvxWJbPDwJX56Ooud3SSW
 JqOvkWleiEJ1gMTA+vwK2hxDR1JogF5REKENFCEfrEiEuYuBdcBaY+JUGVm7jgrhTMjR
 2FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cKjvdxPILk0jm57SrpZOSRJWB+g7msED20iGZuVWYfc=;
 b=mw9A72/O4Hdi5MB6dBaCCFjvnc+xCZ1VJN0813wFBnHVqf0MXXOiPGmScWuYnM+SOJ
 33vz+/uifpDHQV2BoOeYurBMm9TShGn/bfq38MhyC+1DmeErHKYc/6s3oEeoqRRg1FHL
 Zx1E2PBWPH/k1kTLAbUDlygEPdZ1zEy38Lhwddg6LrRTSbdFk2QewzdNCSVj75oV1qe8
 fj/2OcFNx4MnGqHSBg6cP51cgHRJD6pjQxcjE/lS7+G6lGJCNVDmabW4ceA5/5cnIexb
 63gICt86IaF3wXB2zGk326UTaKbbAqlLuwKeJKRBKd5BEPY4TneAIK45sp/tXm4MlRmM
 evug==
X-Gm-Message-State: AOAM530gPE/U7uDASGrA7QPZdaMbtqvBGfy4aOmuA/qzrYTqe7g7u7+/
 oTi7l+kUepE8u72YEVvk8Tg=
X-Google-Smtp-Source: ABdhPJzWZbc3QJSxF/3cevQCljirbSVhS6jQWHBao++lq80I+jwWyNr+3KOTtvMS7jzQlPj6QLT7Ew==
X-Received: by 2002:a62:34c7:0:b029:28e:addf:f17a with SMTP id
 b190-20020a6234c70000b029028eaddff17amr3976240pfa.62.1625305638150; 
 Sat, 03 Jul 2021 02:47:18 -0700 (PDT)
Received: from [192.168.93.106] (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id 199sm5100275pfy.203.2021.07.03.02.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 02:47:17 -0700 (PDT)
Subject: Re: [PATCH v2] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
To: Neal Cardwell <ncardwell@google.com>
References: <20210702194033.1370634-1-phind.uet@gmail.com>
 <CADVnQynvWsD2qWfw4qJsNhyyPXbFGfhZmhMzaggfJ8JtUUt9VA@mail.gmail.com>
From: Phi Nguyen <phind.uet@gmail.com>
Message-ID: <f3d57ece-8fc7-f0b1-a675-32cfcd64bdda@gmail.com>
Date: Sat, 3 Jul 2021 17:47:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADVnQynvWsD2qWfw4qJsNhyyPXbFGfhZmhMzaggfJ8JtUUt9VA@mail.gmail.com>
Content-Language: en-US
Cc: songliubraving@fb.com, kafai@fb.com,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com, daniel@iogearbox.net,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 edumazet@google.com, kpsingh@kernel.org, kuba@kernel.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org
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

On 7/3/2021 4:31 AM, Neal Cardwell wrote:
> Please note that the patchwork tools have found a style/formatting
> issue with your Fixes tag:
> 
> You can find them at:
> https://patchwork.kernel.org/project/netdevbpf/list/
>   ->
>   https://patchwork.kernel.org/project/netdevbpf/patch/20210702194033.1370634-1-phind.uet@gmail.com/
>    ->
>     https://patchwork.hopto.org/static/nipa/510221/12356435/verify_fixes/stdout
> 
> The error is:
> ---
> Fixes tag: Fixes: commit 8919a9b31eb4 ("tcp: Only init congestion control if not
> Has these problem(s):
> - leading word 'commit' unexpected
> - Subject has leading but no trailing parentheses
> - Subject has leading but no trailing quotes
> ---
> 
> Basically, please omit the "commit" and don't wrap the text (it's OK
> if it's longer than 80 or 100 characters).
> 
> thanks,
> neal
> 
Hi,

I didn't even know there are patchwork tools for checking formatting. 
Thank you for pointing out, I have just submitted a new version.

Best regards,
Phi.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
