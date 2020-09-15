Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED009C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 18:13:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65E4921974
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 18:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IE/Rr4l5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65E4921974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CFB3B86A81;
	Tue, 15 Sep 2020 18:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id poAPKV0623Vz; Tue, 15 Sep 2020 18:13:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F1B986A7B;
	Tue, 15 Sep 2020 18:13:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6855FC0859;
	Tue, 15 Sep 2020 18:13:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40B2EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 18:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2C2DA8443E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 18:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DI3GBzyg4q6U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 18:13:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8AECD84417
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 18:13:52 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id y11so3904163qtn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 11:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=PkfGd1AFuSaun8fDUiryvY9jnrNtkMGkmE9AZRe7yos=;
 b=IE/Rr4l5Em7F95R7NhtZd7mnz4VVkjx5jC6FNA96lRcHaLW1mxvvLeLWcKzOz6X/f8
 Lf8Vm4b3gsFHqlBagMXtRdAlODBb25VUmfauKEwBqFFD170/Ku0aSc3t5pRPpqziJJ0D
 FInveJxq3fhMcCeE3LVJyXXy1RcJDFZ5Hm5Q+F8M3G/Exbi7TL1SKlguUlOIc6/tgNKF
 aomCwd8WXY0huDUvkz8PBzx2c0gdgyAocu4qIK9axHcu5onwOb52G14s49xvHI/jYf/V
 yK+oeXBVK9B66oHnbND/ofMAIiddDr5zkzr6cpgkIxFl9/OdPYl6EccWqaGb5nOxiQ5E
 hK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=PkfGd1AFuSaun8fDUiryvY9jnrNtkMGkmE9AZRe7yos=;
 b=mNKrxlT/FUyQTpCQOh9cqsMgl/ZPFbKvlwqgWY3tkUf5eA5exg/qFVREzlHPwbUvZ1
 ZqdvjljD+1jJx4EMkjx6VIwDI1WBLMwpzlaaVOyIvc8zfDdta6+HxlHLGrigUraeWpc6
 e0b8fukwFX79yx2nkEmtTm8JsSqAShwTNXtfP5q6gEjVXEr+B9AZUq302D8FYSyNAbT3
 wVMp78xifsXdyJV1yrcyuNNGevtRhqvlnnY03r4Ygt/e/C/O2Y1ZeUs31e8ErlMnmvNZ
 7K1n28Olua3+vyzack3Ln0jlP1/9qnWSlM2Ffbn/sC9zEBN8jKnJzpIllFHkscTtgtRS
 KyVA==
X-Gm-Message-State: AOAM530ysDSYkK3xkjYavxY053M8lisfk3ZRhcgbrAxRsqn0mJQPMHIn
 7PyOlnbzyD99ZTFfwimiJzc=
X-Google-Smtp-Source: ABdhPJzrzn2PMydfT2DVw16s4CG4h17YOiXLocDodOhJHzPQxvvYoWYpJlhpzstPv+46wSqWaBYm0Q==
X-Received: by 2002:ac8:44a7:: with SMTP id a7mr7104598qto.173.1600193631564; 
 Tue, 15 Sep 2020 11:13:51 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id r64sm17485003qkf.119.2020.09.15.11.13.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Sep 2020 11:13:50 -0700 (PDT)
Date: Tue, 15 Sep 2020 15:13:46 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <607EC72C-E8F5-4998-87FF-EABB1FC717EC@getmailspring.com>
In-Reply-To: <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
References: <CAMuHMdVfoQ-vW3VeO8vDVALNREBV1afaSnwnc0jnkoXmvw6xhQ@mail.gmail.com>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "=?utf-8?Q?mchehab+huawei=40kernel.org?=" <mchehab+huawei@kernel.org>,
 "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [v10 3/4] media: vidtv: add a bridge
	driver
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

Hi there Geert!

Sorry for breaking stuff :)

Anyways I just sent in a fix. I decided to drop that entire function
because as I said, it needs a do-over and that can be done later at a
slower pace.

I'm not sure on how to go about testing this properly. I tried 'make
ARCH=x86' for example and it built fine, so I assume this is working?

Otherwise let me know.

-- thanks
-- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
