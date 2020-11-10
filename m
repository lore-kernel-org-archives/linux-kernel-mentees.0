Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92EEC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 18:41:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18189206F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 18:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fePttSSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18189206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 72D1522D22;
	Tue, 10 Nov 2020 18:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjpvVZZ+UZ22; Tue, 10 Nov 2020 18:41:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9B2EA22CB0;
	Tue, 10 Nov 2020 18:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 850E2C0889;
	Tue, 10 Nov 2020 18:41:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5D61C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B23FE860F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id If7-m71tx-z2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DC3DF864B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 18:41:38 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id a25so10166648lfb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 10:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mpq9Hh5oaIMaEjebKXSNzvGlwg1XsD+b7chm/CUP2YA=;
 b=fePttSSlhz4A0FbGXFWv/RW3vF5YxXYOs6OYOfFDxUaj/hgRjwgCXjqNS/RVJgGaj8
 /Il/6/y3MEVIPTFYYZEhqkkGAD9SRigQi6HuoICKL2CRuwhonogkw3FIs40uJ5OhZyZE
 eEi5BAUE5hBiLxmfSqVck5mmDMJlE9kHMZYngVdlML54FVXe2YEGNhmKtSDO2iE8IU1D
 5agNf4qK8SJrrCBBqcx9tgVBA5qQQnC1+Ejvpmk/RQqQEMbpSECwNa/NyrAh24XavyS9
 41EFlSlinoUuBS8ytWulUVDjg07tOklVGUs66Fps0F/+W2Aatl9aK7fCoGuEhxxvpeVB
 b7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mpq9Hh5oaIMaEjebKXSNzvGlwg1XsD+b7chm/CUP2YA=;
 b=U4R/F3RGqRTWo5buCDtblSWVZ+caP1nvTAYtnF0Z3tYIWCzd7zEfiEipEvurxHA9LW
 kEoYx67+Wjv6aib1evXzopl6HbZ94bSLxlcyTaNUxr98DQ5kYY/9eRsmxH0ZSNELoGrR
 3dAvDUPOqQOgT1ZoppAyKx+Nu/UR4XxCz3MKj0OUPDrKSpyr+P4UCSqMb5U5UJmphPUn
 yx4Y8ZrnCaC01imijikmZ9Q/nt5cvnb0lM2YJec668QSItTCNGqqFxiESHFaHBXFBbz7
 YfRFBwZA18UKJ/hkVQlKUHOjby3nC1ZxXV9ebCgFNVrT7jY1qvFgGaIgUYnfXM1ktyMD
 0qFQ==
X-Gm-Message-State: AOAM533EVd+yrpXJUHI2/Oq5pyXc4TbcKxktlFbpS/LNwg3/3be92yUB
 f1PePrAj4wW7MoCb6h30fZFcjKChqPvN5dyyc00=
X-Google-Smtp-Source: ABdhPJzy8Odkj2zHVgmTaIehz7NkfKBHReqy5Ttqrly35nD8mQkrB874xf8Rcy4ZmL1M1QCJHcvMcEgUt5HfHD8xk28=
X-Received: by 2002:ac2:598f:: with SMTP id w15mr1200643lfn.148.1605033696599; 
 Tue, 10 Nov 2020 10:41:36 -0800 (PST)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 11 Nov 2020 00:11:05 +0530
Message-ID: <CABJPP5DjToH6UXKuKoyCk_vKZux1cBoD4yRpGsWBXM9iZS2fKw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] git_commit_id false positives
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
I was looking into GIT_COMMIT_ID warnings for checkpatch
and certainly there are false positives which needs to be fixed
as also said by a previous discussion.

But before fixing it, I would like your comments on what should
be fixed and what shouldn't considering the added code can
be complex.

The data below is an evaluation of about 50k commits from v5.4.

$ cat checkpatch_out_50k.txt | grep -A3 "GIT_COMMIT_ID" \
   | grep "References" | wc -l
45

First of all there are 45 warnings of type:
References: 2248a28384fe ("drm/i915/gen8+: Add RC6 CTX corruption WA")
References: 860afa086841 ("drm/i915/gt: Flush gen7 even harder"), etc.

Should references be simply exempt from this check? I don't
know much about it. But seems checkpatch is incorrect here.

For other messages,
$ cat checkpatch_out_50k.txt | grep -A3 "GIT_COMMIT_ID"  | \
  grep -v "GIT_COMMIT_ID" |     grep -P "^\s*[a-z0-9]{12,}" | wc -l
468

There were 468 missing "commit" word before the GIT SHA. Some
of these were due to split lines. I think that could be fixed with some
effort.

And finally the other fixable warning is for those with split commit
titles itself.

Other than that, there was also this particular case with non escaped
quotes within the commit title.
Like:
commit 97a32539b956 ("proc: convert everything to "struct proc_ops"")
Should this be handled as well. Or is this a human error? I am not quite
sure.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
