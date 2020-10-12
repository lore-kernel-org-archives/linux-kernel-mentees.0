Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_05,DEAR_SOMETHING,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002CCC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 09:38:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 648C720776
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 09:38:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkwC2oki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 648C720776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D93AA8605E;
	Mon, 12 Oct 2020 09:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIy3ID-3A5kb; Mon, 12 Oct 2020 09:38:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2782485FFD;
	Mon, 12 Oct 2020 09:38:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CF31C0052;
	Mon, 12 Oct 2020 09:38:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B228C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EAEAB2076F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8Q6DqkH0Nl2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:38:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by silver.osuosl.org (Postfix) with ESMTPS id DBCBC20532
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:38:24 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w204so2925721oiw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hxYySEq9Cdang862Ey8rErr01XevORvfeJ+PkEOphgU=;
 b=BkwC2okiECYLmt3afzrVPSbKEk1oDxoA72uZ6sDH2SBA0aDxhKtgKUtk3PgK/Ofwjk
 Da4v0nxd2fLErhQMJ91ZXOoBMZnMknkQvVMruUy8sLTONyrOQPDnzsTEVOi/DCZ/FhYm
 RG0MRqbcYXQzXCEcnUfXzETLmsRY970A5NCvog5CEscRHNU2ZeYRkPtDLaiQoVTFIr/q
 nvH3vFxWxzjImdiKh6XOHEk39Mw3LabCGJvwkyYZkKblRtZryOCilqTDUsJR3zibB+q0
 84zO+N76szSd5wi+2ZViZXqXKeYei5RZQaZeva5+7u0iHI0mDZxhXcMLPkT45X5BfSyC
 21rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hxYySEq9Cdang862Ey8rErr01XevORvfeJ+PkEOphgU=;
 b=fvL+mu6faWxIMYo1M30hr2dEfVrmuImcPmnAF1m7Hm3l3irvZsIR6gfeVEjIoQXopm
 9fM1REmBXmuBpQzQujB3xUQKtj8BSl/l1Niws9kQtWvYgbhgNISbxUSt9QPuec5Vq5Ym
 Jj45MJifhJDQfV9W1zBPG/WQb/KhdDWWCJ0APyze/97Pf0JQW82Z1cTNAReGNEO5XKv+
 wwRMT8Ig1eyAnxPZITjbmzj1Ru9Wn1pZKdJu5St1q+CSFekn6f9pvdxnD31rzxkPk479
 Fj5bfm3zHeK+ctIfzJWjjO3uzgtbfY9OXekNPAAqix3M2mFM8lBSfT8l+ND9np/ioFWI
 bfzA==
X-Gm-Message-State: AOAM531MZTCVDCMnIKtp5JBDQHoEDR8kxonPCiWHzUHtQ0uXfTuuvkQ+
 LUc5ArhOfUd0Puf2cE2XQkrkcOjO7OK2Ft3AWMdoMBpw7dXOnw==
X-Google-Smtp-Source: ABdhPJzwMYVLzRRefPP7qU5xW1Yyf33LiljPLcdvcBOxfWiomaF7lx1jvd7dZAn7b80xDWTTp9YEFioXT0ymVVvsYyM=
X-Received: by 2002:a54:4615:: with SMTP id p21mr9690723oip.79.1602495503730; 
 Mon, 12 Oct 2020 02:38:23 -0700 (PDT)
MIME-Version: 1.0
From: Aditya Srivastava <yashsri421@gmail.com>
Date: Mon, 12 Oct 2020 15:08:12 +0530
Message-ID: <CAJ7RK2spHzFJxAqkm+N=T4ZB8-SeqgCX+Bs5r5__eLJRbovL3w@mail.gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Checkpatch.pl tasks for Community Bridge
	Program
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
Content-Type: multipart/mixed; boundary="===============6279919817289910361=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6279919817289910361==
Content-Type: multipart/alternative; boundary="000000000000410a9b05b1760f90"

--000000000000410a9b05b1760f90
Content-Type: text/plain; charset="UTF-8"

Dear Sir/Ma'am
I have performed some tasks on Checkpatch.pl to find out the aggregate and
summary of Errors and Warnings that have been generated on certain Linux
Kernel Versions' commits . The summary of my tasks are as follows:
1. Task1: Create a list of all non-merge commits that were added in the
version v5.8 but were not there in v5.7. Run checkpatch.pl script on these
commits and create a statistical summary of findings.
My findings:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task1/reports/aggregate_report/analysis/summary.txt
My Scripts for this task:
https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task1

2. Task2: Test what are errors and warnings by checkpatch.pl reports on
v5.6..v5.8. Generate a report with respect to changes suggested by
Dwaipayan Ray (
https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gmail.com/),
to present the differences in a suitable aggregated form, to find out the
kind of errors and warnings that are changing.

My Findings:
Change in the number of warnings and errors:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/summary_relative.txt

Individual summary report generated by checkpatch.pl:
After the commit:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/summary_after_commit.txt

Before the commit:
https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/summary_before_commit.txt

Scripts used for this task:
https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task2

Thanks and Regards
Aditya

--000000000000410a9b05b1760f90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Sir/Ma&#39;am</div><div>I have performed some ta=
sks on Checkpatch.pl to find out the aggregate and summary of Errors and Wa=
rnings that have been generated on certain Linux Kernel Versions&#39; commi=
ts . The summary of my tasks are as follows:</div><div>1. Task1: Create a l=
ist of all non-merge commits that were added in the version v5.8 but were n=
ot there in v5.7. Run <a href=3D"http://checkpatch.pl">checkpatch.pl</a> sc=
ript on these commits and create a statistical summary of findings.<br></di=
v><div>My findings: <a href=3D"https://github.com/AdityaSrivast/kernel-task=
s/blob/master/Task1/reports/aggregate_report/analysis/summary.txt">https://=
github.com/AdityaSrivast/kernel-tasks/blob/master/Task1/reports/aggregate_r=
eport/analysis/summary.txt</a></div><div>My Scripts for this task: <a href=
=3D"https://github.com/AdityaSrivast/kernel-tasks/tree/master/Task1">https:=
//github.com/AdityaSrivast/kernel-tasks/tree/master/Task1</a></div><div><br=
></div><div>2. Task2: Test what are errors and warnings by <a href=3D"http:=
//checkpatch.pl">checkpatch.pl</a> reports on v5.6..v5.8. Generate a report=
 with respect to changes suggested by Dwaipayan Ray (<a href=3D"https://lor=
e.kernel.org/linux-kernel-mentees/20201007192029.551744-1-dwaipayanray1@gma=
il.com/">https://lore.kernel.org/linux-kernel-mentees/20201007192029.551744=
-1-dwaipayanray1@gmail.com/</a>), to present the differences in a suitable =
aggregated form, to find out the kind of errors and warnings that are chang=
ing.</div><div><br></div><div>My Findings:</div><div>Change in the number o=
f warnings and errors: <a href=3D"https://github.com/AdityaSrivast/kernel-t=
asks/blob/master/Task2/reports/analysis/relative_change/summary_relative.tx=
t">https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/=
analysis/relative_change/summary_relative.txt</a></div><div><br></div><div>=
Individual summary report generated by <a href=3D"http://checkpatch.pl">che=
ckpatch.pl</a>:</div><div>After the commit: <a href=3D"https://github.com/A=
dityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/after_commit/s=
ummary_after_commit.txt">https://github.com/AdityaSrivast/kernel-tasks/blob=
/master/Task2/reports/analysis/after_commit/summary_after_commit.txt</a></d=
iv><div><br></div><div>Before the commit: <a href=3D"https://github.com/Adi=
tyaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/before_commit/su=
mmary_before_commit.txt">https://github.com/AdityaSrivast/kernel-tasks/blob=
/master/Task2/reports/analysis/before_commit/summary_before_commit.txt</a><=
/div><div><br></div><div>Scripts used for this task: <a href=3D"https://git=
hub.com/AdityaSrivast/kernel-tasks/tree/master/Task2">https://github.com/Ad=
ityaSrivast/kernel-tasks/tree/master/Task2</a></div><div><br></div><div>Tha=
nks and Regards</div><div>Aditya<br></div><div><br></div><div><br></div></d=
iv>

--000000000000410a9b05b1760f90--

--===============6279919817289910361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6279919817289910361==--
