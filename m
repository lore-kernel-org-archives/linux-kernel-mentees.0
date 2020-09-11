Return-Path: <SRS0=DgfW=CU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=BAYES_50,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C840C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 17:56:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAACE20732
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 17:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jafQF6La"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAACE20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57CF2871FA;
	Fri, 11 Sep 2020 17:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OauVkW7kRMAl; Fri, 11 Sep 2020 17:56:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF01D87049;
	Fri, 11 Sep 2020 17:56:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9393AC0859;
	Fri, 11 Sep 2020 17:56:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 185E0C0052
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 05:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0787C87752
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 05:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKvZT2RVBfLU
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 05:48:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 86330876CA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 05:48:46 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id u6so9794221iow.9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Sep 2020 22:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
 b=jafQF6LaYmSEr+5iTHSwPM9bTKF4xU0uI6pXCVhaFyXFBGa6OlCurfZ1Hw2YuqDB7w
 GK90W0BoOvWR5HEx29s8m13iGczuhc77XZvmCA5rmpOTqELEQD6bqTgIJweaM2A6PTyN
 SNYL3blU7gL21Elqew/u1g/OKJd8C/NIVY/ydqWr8sL3EB/nUX8DJiNqUJftz9ZUiZuW
 5UTLX9FCQH9H3absRkLTvPeS7Gfks5Xkq4eHLrZrEcnnQPpCbyCBW49aeR/UCrW1hDXq
 giO+vLMs5YVawUMAzmvU7TUnbUOW3w8HTdEKtcsuNRIzv6KxFGcN60e/+kxHiupdsq0I
 Zwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
 b=klf9VAexfVcDC3kZ0kq+q1mJGvdy8bc0x9GSybt5YRmrDn0UgVXsxG21S2agF8gBrF
 iqIcTAvjvEvcR/BB+I8jnoRWrLfeCMxzXx6HKaP7Io0ksbOSnwueKpV/E7DykxvstfdB
 Tx8Aiq7N9kwKBq789LKo6I0e7iK2j1HN22KUMARbsDzfmwglRpJ64QK0htoaf29s3hKg
 QVild2DC8jTllLOE1PLu6QXtQCk44yVBr2Vib1mPYpcPcwSs9BCCymdASWCOA092X3uY
 v6d5oNXZ/o2IeZbtmYA+3P5Sq11aRGv/1cRdNTtYaWNzf7x85BlyxxZQXRgSWWwmmcb1
 54wg==
X-Gm-Message-State: AOAM530d8QjsDNa3WAA62jfNMtfA1ZxlLBnxSWdiatI/dIMrcHclHlP4
 1x6C9QJmve3ETfsTyCbzQp7GVMUcY5wuXPILFKyZ9VDUSHE=
X-Google-Smtp-Source: ABdhPJxHIhMSZlbXtgrwhiStmxFzEbGBJvzK4nD+Kh3LvXQgTwwMjhdzmqgFcLMFYWBNRX/fWQQVKsxihGYG3KeIbr4=
X-Received: by 2002:a6b:d606:: with SMTP id w6mr513380ioa.89.1599803324372;
 Thu, 10 Sep 2020 22:48:44 -0700 (PDT)
MIME-Version: 1.0
From: Himadri Pandya <himadri18.07@gmail.com>
Date: Fri, 11 Sep 2020 11:18:27 +0530
Message-ID: <CAPnhUpaLL0_Qz4N0GGbYovcBhhY12HA3M-atmaQJqnjAn3n_gQ@mail.gmail.com>
To: Linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Approved-At: Fri, 11 Sep 2020 17:56:09 +0000
Subject: [Linux-kernel-mentees] unsubscribe
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

unsubscribe
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
