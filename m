Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7163C2D0C8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 04:08:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0202053B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 04:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asSVrFaS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F0202053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 46B3E2035C;
	Tue, 31 Dec 2019 04:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6cMoGRi819iL; Tue, 31 Dec 2019 04:08:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 468BB203A5;
	Tue, 31 Dec 2019 04:08:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D26EC1796;
	Tue, 31 Dec 2019 04:08:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBDB5C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 04:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A578B85629
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 04:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Fz6Be5PDARA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 04:08:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2CD1E85CE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 04:08:17 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id r67so694430pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 20:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gmHUJOLLaB9uQbD8xdSCvMaI/BTVpj9YMHVwUXulGHY=;
 b=asSVrFaSM3ptGq2G1MOscGcpUb01d26yJ1MzLhamktRoZQ8FiIByFbu4HdTPDnyuwS
 1fTRng1wvRzkpGYrqENuhUmdXDUqWJidl8EKK462/b3EMgBvoRCpt3VLzzBU2cZgEms8
 JRUNiERTzLQltnJJCAy1PRQSqI766WvO0gQ/PqEO7mwVPx4Kl7aQHjoSvRVYGdymAYT/
 YyKtW9wrzRD6+lnuz8n40iyHhjofP0RamyjZQrwTJMLDozxGLKomLvugc5EU1ZUYAHri
 K9kKSeiBOL6CFFkrMlmllIle4HgXUTJU682iRuwtttYH98Hl0w06kNpB10iIX19/TFei
 jGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gmHUJOLLaB9uQbD8xdSCvMaI/BTVpj9YMHVwUXulGHY=;
 b=lS2g7NGdC3yTdJH6+rER9skOW/wkDj7s38+2BMwHpzcd9aJsD+PP2snBNB8C80m1nQ
 aBb4JFJeO8v/xXCfmE2nxHQ9JPOXD+pFhrdCyjy7s9uLhgZfS1LTJF3Nlyi6FcImHp4t
 mOqPjXHhDS+0vJ9aYp4JTpt5aj9fN1z5igevBHCBiskehRqo4mDY7Y1Qnpko9SmY06v2
 7FrynmRosTgIXj5Tz47J02K9j/8qaiiOBlGujlQVP22U1x6t9RAI5g9KA43PJWy3fz9D
 9PnUiSBEIWljMChtj8VgwTO2w3NtHXjw9mPA+WRX3ckKIt3xuPKrtsl08XEJHR/iknFC
 Z90A==
X-Gm-Message-State: APjAAAUXMoYH3/BdZc/SlPxXgQxQ2M3J0SFFSfK9P3wlnql025bHIm/F
 blTK3gYzNwqqEesGp+ZJuwO9u/uPYqY=
X-Google-Smtp-Source: APXvYqwsLEkZt9ztYkbDCkRzSfI9MOyqrR4KZI+qAEuOfLBSooRKkbzRvuewk5oCTkPh9BXzgrJ7tg==
X-Received: by 2002:a17:902:728b:: with SMTP id
 d11mr59344353pll.49.1577765296478; 
 Mon, 30 Dec 2019 20:08:16 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:da15:c0bd:33c1:e2ad?
 ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id c184sm54318701pfa.39.2019.12.30.20.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 20:08:15 -0800 (PST)
To: Jonathan Corbet <corbet@lwn.net>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
 <92be5a49b967ce35a305fc5ccfb3efea3f61a19a.1577681164.git.dwlsalmeida@gmail.com>
 <20191230121807.3a1f5f38@lwn.net>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <47e2ea6e-a808-5012-6f9a-8800fbd3be00@gmail.com>
Date: Tue, 31 Dec 2019 01:08:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191230121807.3a1f5f38@lwn.net>
Content-Language: en-US
Cc: mchehab+samsung@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/8] Documentation:
	nfsroot.txt: convert to ReST
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

Hi Jon, thanks for the review.


Would you please rephrase this? My first language isn't English and I am 
not sure I understood that.

> It's best in general to avoid refilling paragraphs so as to make it clear
> what is being changed.  But we would also like to avoid creating such long
> lines.  Perhaps an add-on patch refilling things would satisfy both
> criteria here.



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
