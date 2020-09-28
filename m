Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DC7C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 17:12:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EAFB20773
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 17:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pByaLf9X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EAFB20773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04265855F6;
	Mon, 28 Sep 2020 17:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Zap_UHWNnPe; Mon, 28 Sep 2020 17:12:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 92EAE8558A;
	Mon, 28 Sep 2020 17:12:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77238C0891;
	Mon, 28 Sep 2020 17:12:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A108C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 17:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4994687060
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 17:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8UF5UB5n3j5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 17:12:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BCEDC8702C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 17:12:20 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id h17so1690560otr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QEBpUa9STJl2wvcoZHM9Qp83dQ90CUQEUH5xPYF8a7o=;
 b=pByaLf9Xh4d1K9pohKWaLwbJtfDGqaLPSZTv7mKSXr0clGyiSZuRQct9xpCYtLBW/M
 Fr+mre+9zDVJ4x1oYoix4rG3tT8PWML/+MgsF9bDV+j8J9pnZPLWW3icEcp0bxTwFRBy
 sE+LW84pgizD4PhmCucVa84KsrW7cQGMQNYfoMd0OyGJwUoW9ag3NdS1UFtDYMagjbCM
 308tmy0F+GIb5dwKF1Nsmy1lKNn3Ztldpm0yHCMuz30MeErwXYpO8Rnld28q6xdZuM5O
 iP168gLkcbxCyDO+LE2GPWxVEvJcZKQzCI7obTL6yEdPlyNAg7CLll0GF6Z8UbfCWCTe
 du6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QEBpUa9STJl2wvcoZHM9Qp83dQ90CUQEUH5xPYF8a7o=;
 b=i/PQxMsIjX6FE8N2xUncmRnVldCSCsPs7gFmsZbhf69WxlIQSHEGAJIi/LXA2losxm
 g3n3FVvIwCgRTf/Yow6phIas4JtmBqUksUk8NRM0yFp8Kh6zKkC5zpRzVG/bVylRm83Q
 WZF2ABWrkGY9Q8uMfUWlGvoke0imJ/vDiVXpWo7AHDJFwDxY+OKbhINImpaNoA+Pmg8C
 9shfY6GjDG1wcPey0oTXgbCTi8OQKav3om8RegAknpqwg/PbFsL+qfwGnjJThMFKvUyW
 V5BiDAmKQup8keE3YDm10kYGDzUpF0krvkQKAc67k8EdRdsmKYfY1RU2F/YmslXwrqgq
 hAyw==
X-Gm-Message-State: AOAM533rvtQvjY/547n+w5SgKndghS6ZkTkZgI/gthjX0GA00F0676MW
 GTnmMMPzhUdP1IPE0J3aXAj2BcNYpDV8Oknjli4=
X-Google-Smtp-Source: ABdhPJxaCp1QdQPRkTo4l7QehG1rm7YAqsI9mHvNIm2c2sIT2PQ5wirKtQvLZt3C7thYU1HnJqcuqPOoTY7OuC9Q03s=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr1574453otf.265.1601313139450; 
 Mon, 28 Sep 2020 10:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5D=q865sMYM768=qyY-gavG3VEyT4X1qGLsPT9umkTE8Q@mail.gmail.com>
 <alpine.DEB.2.21.2009281805030.4154@felia>
In-Reply-To: <alpine.DEB.2.21.2009281805030.4154@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 28 Sep 2020 22:41:58 +0530
Message-ID: <CABJPP5DCnie+iLeeu0hVgvaVsOPk2fX9K59hLdhKO+SzoCJOQQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl investigation:
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

On Mon, Sep 28, 2020 at 9:44 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Mon, 28 Sep 2020, Dwaipayan Ray wrote:
>
> > Hi,
> > Checkpatch seems to generate some false positives on
> > certain macros.
> >
> > For example running checkpatch on (kernel/trace/trace_export.c),
> >
> > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > #49: FILE: kernel/trace/trace_export.c:49:
> > +#define __field_packed(type, container, item) type item;
> >
> > ERROR: Macros with multiple statements should be enclosed in a do - while loop
> > #52: FILE: kernel/trace/trace_export.c:52:
> > +#define __array(type, item, size) type item[size];
> >
>
> I guess checkpatch.pl detects the semicolon and thinks it must be two
> statements. How about checking if the semicolon is actually followed by
> anything or not?
>
> > and several other same errors.
> >
>
> Are they all in one file or spread around in the kernel everywhere?
>

Yes, there were all in the same file. I have to run checkpatch on other
files extensively before I can confirm these issues exist elsewhere.

But yes, checking for a semicolon followed by some characters
does solve the problem, and changes the warning to a (Macros
with complex values...).

I do agree that such complex checks should be left to clang-format or
likewise.

Not sure if it is worthwhile merging, but here goes the diff:

---
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9e65d21456f1..8382977e95fd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl

@@ -5351,7 +5367,7 @@ sub process {
                                if ($dstat =~ /^\s*if\b/) {

ERROR("MULTISTATEMENT_MACRO_USE_DO_WHILE",
                                              "Macros starting with if
should be enclosed by a do - while loop to avoid possible if/else
logic defects\n" . "$herectx");
-                               } elsif ($dstat =~ /;/) {
+                               } elsif ($dstat =~ /;.+/) {

ERROR("MULTISTATEMENT_MACRO_USE_DO_WHILE",
                                              "Macros with multiple
statements should be enclosed in a do - while loop\n" . "$herectx");
                                } else {
---
Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
