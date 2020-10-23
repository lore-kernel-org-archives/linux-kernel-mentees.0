Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51651C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 06:38:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3BFB2192A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 06:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTvjxTQf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3BFB2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3442986B11;
	Fri, 23 Oct 2020 06:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leJAL5taAEY8; Fri, 23 Oct 2020 06:38:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BBA82866DA;
	Fri, 23 Oct 2020 06:38:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEA6DC0052;
	Fri, 23 Oct 2020 06:38:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A75BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1A6A7867D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPP9g0X18PeJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:38:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8DEC0866DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 06:38:32 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l18so458744pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=du8DG9bmuPrMxShvvb8aQjcXCo588n8MEAUeaDJS0ro=;
 b=jTvjxTQfWphPej6/1PfD28lAXYm0U1g/W21bzQeCqu/U7L+Z4hR6zakhVUaNOBMqGx
 mee05wg+ZhnecR3FA+jjvoAjjCHhabm5pDHXc69JP7E9ZdS43xDoKP7XLQ3+Uja0jZqG
 NPq2zBHqVWTCr98O/4qBN7dFoxIbd3r/CeTdulmx/IJjhmbQlIVEjWRS17O6J/u6ZJsW
 VotXK4KtgnVJzmhe4O7e+1F2zIWGWFY0xSM3+B65H33q11j6GuukRYP0uEJmf+spdr9/
 CvGUqJPDdc1yrNfGrbcovPJGwQZ4ZZPZmtfaxsfm96t4Rp/VCF9GT0YOaexVWbXoCPvo
 O0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=du8DG9bmuPrMxShvvb8aQjcXCo588n8MEAUeaDJS0ro=;
 b=aB0iS/VyW6wgnwoco6FFM+hb91+7GQSD1vc+vUgdcGeFWCtdLQr/uMIPfqrpeJ0v2A
 KcunHeWhfXdcl+xf1rTDylI4chFI7C8CgfmC9cQm29VObdGix/iulNjR+W58it02o+PC
 5vEdz4nzu0IR3bjQRn34COVbcCg6DbNiZ8a1GuV4uU6Zaz5HhDo8jGr/1lvZCtKq9M7I
 1rR/LHYISVVfG5rJld4d/Cb2z2KUm3ECk4TBXEhV8F5EyBkMc4SYauymywtQoTPqWiEt
 6UpwCeP4O5HbWdIIiX2ZZlk1/mL9Qr1JI3itQB4xIeRTkUweak9B0cybEL0THtNwBlcA
 tukQ==
X-Gm-Message-State: AOAM532K8ma+lR9Ab9WCG41szrSAczRHU2K0DwMlLrn7Cfu4Cy+SVcar
 kGmkWUMQeRu81Hy64sHYKuU=
X-Google-Smtp-Source: ABdhPJzgGubHtwtPVlQoW1i1YjP4CmDgF6KXik8vWFvSdt5ceVFh7FEl9ivr6PamrnrGEDOveB0pig==
X-Received: by 2002:a17:90b:110b:: with SMTP id
 gi11mr819076pjb.25.1603435112090; 
 Thu, 22 Oct 2020 23:38:32 -0700 (PDT)
Received: from ?IPv6:2402:3a80:429:6ba7:30ef:4722:a786:585f?
 ([2402:3a80:429:6ba7:30ef:4722:a786:585f])
 by smtp.gmail.com with ESMTPSA id l3sm741272pju.28.2020.10.22.23.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 23:38:31 -0700 (PDT)
From: Aditya <yashsri421@gmail.com>
To: Joe Perches <joe@perches.com>
References: <20201022145021.28211-1-yashsri421@gmail.com>
 <4cbbd8d8b6c4d686f71648af8bc970baa4b0ee9b.camel@perches.com>
 <5121bf7c-a126-6178-62ff-e54f0bb4cb6e@gmail.com>
 <67247b2d51aa8b2da7377e400e9191733144ed0f.camel@perches.com>
 <edaa9012-d512-26fc-0aca-f0eaf889a050@gmail.com>
 <b853a8ab4daface74075e93d83f94655f13a2979.camel@perches.com>
 <8845d575-596e-b2e0-26c1-16e704074fc8@gmail.com>
Message-ID: <4d32f0db-0ab3-6a4d-9428-16e0651fbe29@gmail.com>
Date: Fri, 23 Oct 2020 12:08:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8845d575-596e-b2e0-26c1-16e704074fc8@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false
 positives in REPEATED_WORD warning
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

On 23/10/20 12:03 pm, Aditya wrote:
> However, though such cases haven't occurred over v6..v8.
> 
> Actually, we could simplify it more on the basis of occurrences in
> v6..v8, for eg. if we check for /[0-9c-f][0-9a-f]+/ (instead of
> /[0-9a-f]{2,}/), it gives us desired result over v6..v8, but again
> we'll miss out cases such as:
> 

Sorry, v5.6..v5.8

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
