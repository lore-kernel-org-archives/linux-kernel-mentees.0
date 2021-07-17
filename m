Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C54C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 04:59:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C4D613D9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 04:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C4D613D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF2F6424F9;
	Sat, 17 Jul 2021 04:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0mZ_hSi9nGG; Sat, 17 Jul 2021 04:59:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E0BD8424E5;
	Sat, 17 Jul 2021 04:59:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B12F7C0010;
	Sat, 17 Jul 2021 04:59:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A55B9C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 04:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DDC140143
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 04:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMjTy5px-txL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 04:59:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C76640015
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 04:59:16 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 70so8678518pgh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 21:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=4KkfTyMDs0f/XRPHWgY/YAYXooWCUpIi9vlLwR8OlGA=;
 b=dxxeJyS3ImvdHPjlzF19R4SzPe0TKo/RsGxGjrjhe3tvTOqhbdUi/mA0E9SATA5H2L
 nmDBrU1zcKcm+Fg6B2WwR/NwyHvZIhGTaEB3xzOYdUW3jB4M418vmJKHxFlcGFV+Yy8J
 XBFT0UJZ2MnFycM9Rpp+5HoqhgFXsPpqY0Xa37eaTrcv5EW7xAeYPaC5jKWVFjti+N9M
 utpDBsVpTzgC+keEy2E4l/RxLv+w7gY5MnYNsE4ZbaIstNf8BmrF+oIwJPrfMbT38/hj
 DZpOlyfNLc8fBgI/dJSDOYu+kNPkOT+xn5RTZ2mm1gedNGcdIHC8547HXhZy1kKOJQng
 dL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=4KkfTyMDs0f/XRPHWgY/YAYXooWCUpIi9vlLwR8OlGA=;
 b=oYBY4dKADZwv4xCXcsFplbpB8jeqcjuag3VobeNr4tZdDXCrBxEIYCoimFt8k7Zpx2
 ewa41w4VO74anemABUvzwwZreIYG/LiTLOl7p8sAxhV9073V8iJn4qwo/lVhtgEMdtmj
 Dpxe5xXWA/TdF/I6nL5UU4xfMNJtZyVYesBVftRZKZ5KrOiXj/HlTreT83rnc6ROifM0
 p2zfN1yAqsGLKEMHLBlO7pbA9culDVd087uTv/hgR/AuuAPWXvefJAs8b281Msnu96hH
 7kHcMqsv3zPeQSIvUHUfu3pg2R9SK9hQF05JP1FT+i9s71RaXIYZEqCtPD2kurMeMI8m
 UnsQ==
X-Gm-Message-State: AOAM531yFDSE8z+QaalDiKb87jxmjphxv+mJVBkUKDw8cYHderRvJmMv
 XKliD8DdBpNErKbcvu9gKr4=
X-Google-Smtp-Source: ABdhPJyndlS9v8C3DI/XEUtvBhe2xtsO2/goPCdwFMiMJfaGjfOb4luKClwm5HYHpQ4KW45qplKtEQ==
X-Received: by 2002:a62:7fc6:0:b029:323:8712:e7a6 with SMTP id
 a189-20020a627fc60000b02903238712e7a6mr13722269pfd.77.1626497955845; 
 Fri, 16 Jul 2021 21:59:15 -0700 (PDT)
Received: from msi ([103.83.246.86])
 by smtp.gmail.com with ESMTPSA id c5sm12144052pfn.144.2021.07.16.21.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 21:59:15 -0700 (PDT)
Date: Sat, 17 Jul 2021 10:29:10 +0530
From: Parvathy H <parvathyhiyer@gmail.com>
To: lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Mining Maintainers mentorship program - mentee Selection tasks
Message-ID: <20210717045910.GA4410@msi>
MIME-Version: 1.0
Content-Disposition: inline
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

I am interested in the Mining Maintainers mentorship program and I would like towork on the tasks for the mentee selection.

Thanks & Regards
Parvathy H
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
