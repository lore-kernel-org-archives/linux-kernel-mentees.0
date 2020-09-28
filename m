Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199CAC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 15:48:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A8C52100A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 15:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFNUYyh2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A8C52100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 335B78702F;
	Mon, 28 Sep 2020 15:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCzHN3l+Jddj; Mon, 28 Sep 2020 15:48:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C465B87009;
	Mon, 28 Sep 2020 15:48:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EBDBC0891;
	Mon, 28 Sep 2020 15:48:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB108C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C01CB86FD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8paoHgLy0fd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:48:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46D8886FC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 15:48:05 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id n2so1821338oij.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IHeJgF74Duigz1f5H3PhhOZoO/7AhqO1VEOnyzffDw4=;
 b=oFNUYyh2vu9ntmnVa99hj4fS7fDVP8FSggECOoUEuSOjNjy6eEuwxzzBP++aqhBIh7
 Oyr/IIa1zhnPJ3xpuPbgoIxEGcdzr+JCXCqdrbT8079Nmw/zAN2/OXmCF1J2rmFslr3X
 TMzISRqEB93+e1QCezF0VtP28pdmlM2IR79kwwUTrmeaozuK7/Z9KySWIHc6jz1+70q9
 qmlbcg2c4MfdlcOtJ7PYFjTZ3W8w21+d50D6etwWfDQL277Qwsr3W/r2YdRAXLPm54R1
 hfBKI7U82Ophhj+6EQUHmRVutlGi+Gy44Re68peSTDJ0G/Vo/HwgwqoKCF/pg0f1iC3L
 ow5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IHeJgF74Duigz1f5H3PhhOZoO/7AhqO1VEOnyzffDw4=;
 b=cAK4wuA0cXZvBNg2mehfpNqnhQI934YgesayxXLGhlJE0F9APNYB2WssHMVLdmobEP
 ICOwnDqsi/DOYLJ3yJLiJnkwSfTe45uPWP50e2lganm4OeuxgMmg1WYlBji2AXhu4JL4
 F79o7DwaNnasmwreuM6qS0hplWvjHDbFvqeiUiicrdxymAhaaLm1oa9or1mMycaytncp
 Zmyxty/4d+mLbbBvNyVr8EWUlvvyPTLFRQS2FLoDgmqtGE1A9SvLi5cfnDYaZDH/K1xP
 1eZBJq9H/ciE/V7P0GzjoHjYKDJ4KjOJ8lkg5E8AbrKUiOV01uN4u2zVcA14DWVQZ4en
 QVvw==
X-Gm-Message-State: AOAM530Lqf8DtJzgkh3/o/uod64W+u7JMPD0LnC4eVysLVL5cszqzCN9
 SioSubxMauebl3PPF4fOZSim5Cn+fHs8wqs0mzs=
X-Google-Smtp-Source: ABdhPJxAxgXnYc0hvTWGyw9x55AuN5jqYBMSl1Iw/z1izje6Q88ZG9qg6Os5GzzK622peFjm7a5pngRbYUb+wjfXQgE=
X-Received: by 2002:a05:6808:6:: with SMTP id u6mr1270850oic.74.1601308084298; 
 Mon, 28 Sep 2020 08:48:04 -0700 (PDT)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 28 Sep 2020 21:17:43 +0530
Message-ID: <CABJPP5D=q865sMYM768=qyY-gavG3VEyT4X1qGLsPT9umkTE8Q@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] checkpatch.pl investigation:
	MULTISTATEMENT_MACRO_USE_DO_WHILE issues
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

Hi,
Checkpatch seems to generate some false positives on
certain macros.

For example running checkpatch on (kernel/trace/trace_export.c),

ERROR: Macros with multiple statements should be enclosed in a do - while loop
#49: FILE: kernel/trace/trace_export.c:49:
+#define __field_packed(type, container, item) type item;

ERROR: Macros with multiple statements should be enclosed in a do - while loop
#52: FILE: kernel/trace/trace_export.c:52:
+#define __array(type, item, size) type item[size];

and several other same errors.

Wrapping this in a do - while certainly doesn't make sense.
Removing the semicolon at the end of macro and appending semicolon
in the call changes the error to:

ERROR: Macros with complex values should be enclosed in parentheses
#49: FILE: kernel/trace/trace_export.c:49:
+#define __array_desc(type, container, item, size) type item[size]

This seems more reasonable. But the error isn't necessary in the first
place.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
