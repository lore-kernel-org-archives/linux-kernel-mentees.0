Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658A4C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 21:47:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314A5206E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 21:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYADeh+a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314A5206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0803189C8D;
	Fri, 10 Jul 2020 21:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uwb7OT2B6H+Y; Fri, 10 Jul 2020 21:47:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4566389C89;
	Fri, 10 Jul 2020 21:47:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34EF6C0890;
	Fri, 10 Jul 2020 21:47:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCF57C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BCA0688B47
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YQEzi_0BNNX
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:47:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EC25788B3C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:47:12 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id o3so6290267ilo.12
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 14:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lg20fj212NyPma0I9tJudm6GKXETAtxEOwc/UMslo3I=;
 b=EYADeh+av5rfCx5XNGiQFZcdedx/VgeA13EN/25N1ZGrAL4NccaTGj1yWInT6uh8mW
 dVH8p4baTHDun8PExeeQX5ixcf61p6EOC/mwZmAMHgGZcx5R3k4q3RcRleoWW+6HOORC
 dIR0bRcgDOZQrSM9YnYcN/JVQ0R1aTCfHXiuQVFWLilZiK31qTgi/SzYtARYZg7ScBdD
 7jJAQDrHokOXIFr8NoJjAXfnWQPAESAxJo/tZ4e2csLwc/qvCxgbLQu+LmnDx41dwQWi
 CuWbBvTwaFSpuz+579OVJJQzERKsAHWNp3qICraJRBl1fGGbJbE+zXk7mhoMd+pUaeNQ
 AJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lg20fj212NyPma0I9tJudm6GKXETAtxEOwc/UMslo3I=;
 b=Oc1nGOByU1H710PSRnwiEIZht1pRORkm3UWlYLb0KDvgwdjWRKgxWAZV48n+jtM2Oo
 coerss0qgHMvZVkFPYV1PKP2xTZsZI7gnrYRZaLAaZ7QT+uhM6z7HtsrOSSCvs4NSPbq
 e7OLOZDOsQbvIapF6znP0oGDCh4XPqqDvHLTqyziHd35p5QNhMjCbfOBGQnUZ2NO1t90
 fMdcvaukDWwnoKsaWxjMyHQn6nFdDWIehBa/7eEbizXnH+YitrKB5d62o3Yt3F3M+Eb3
 MAFEj7EOBc0JkRM3jJgdPOi2pK3rCxHd5siIJOWwfwFow1urQguTcZh2esmdOkSWpi/L
 dOOw==
X-Gm-Message-State: AOAM530kTJDeuCVfI4TWgxdIe2APALEPXMVLtkIEZWnE393PCSe2d9NA
 0o4q2dJyIdxu2VAsuBZiILKZW/9VBJLKmeGdDqk=
X-Google-Smtp-Source: ABdhPJyLDAf0YQ1HehqunHmPI4Lpe/dBRUGGqLLBu9VnueR8BE3lNqYHeg4ITmJmJLLLRImbI84HjQV9Qdh91j2EHi0=
X-Received: by 2002:a92:dc0c:: with SMTP id t12mr54835968iln.260.1594417632244; 
 Fri, 10 Jul 2020 14:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
In-Reply-To: <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 10 Jul 2020 23:47:01 +0200
Message-ID: <CAKXUXMx8RcQrihaYvryhm4N8X4BATLpPmRnDkm6nCmhznugd0g@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Adjust spelling
	check false positive
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
Content-Type: multipart/mixed; boundary="===============6876526797632469384=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6876526797632469384==
Content-Type: multipart/alternative; boundary="00000000000097f98b05aa1d485d"

--00000000000097f98b05aa1d485d
Content-Type: text/plain; charset="UTF-8"

>> For Issue 5: Can you provide me (and the CC: the list) the list of
>> false positives (the commit hashes) you found for issue 5 on
>> EXPORT_SYMBOL?
>
>
> Here are the commit hashes for which the warning is issued:
> 54505a1e2083
> 75d75b7a4d54
> 8084c99b9af6
> bfdaf029c9c9
> dfd402a4c4ba
>
>> Can you also provide a short rationale/explanation for
>> each case that you considered a false positive?
>
>
> In each case the `EXPORT_SYMBOL()` is correctly written and the
variable/function to be exported
> is also inside the parentheses, still, we get the warning. Please let me
know if I am wrong here.

I checked those warnings. Some of the patches are good cases to check if we
can improve the heuristics on EXPORT_SYMBOL().

E.g., commit bfdaf029c9c9 ("ia64: turn csum_partial_copy_from_user() into
csum_and_copy_from_user()") looks sound to me, and checkpatch.pl should not
really warn about that.

Mrinal, maybe you can find out why checkpatch.pl believes that this case is
wrong and needs to be warned about?


Lukas

--00000000000097f98b05aa1d485d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>&gt;&gt; For Issue 5: Can you provide =
me (and the CC: the list) the list of<br>&gt;&gt; false positives (the comm=
it hashes) you found for issue 5 on<br>&gt;&gt; EXPORT_SYMBOL?<br>&gt;<br>&=
gt;</div><div>&gt; Here are the commit hashes for which the warning is issu=
ed:<br>&gt; 54505a1e2083<br>&gt; 75d75b7a4d54<br>&gt; 8084c99b9af6<br>&gt; =
bfdaf029c9c9<br>&gt; dfd402a4c4ba<br>&gt;<br>&gt;&gt; Can you also provide =
a short rationale/explanation for<br>&gt;&gt; each case that you considered=
 a false positive?<br>&gt;<br>&gt;<br>&gt; In each case the `EXPORT_SYMBOL(=
)` is correctly written and the variable/function to be exported<br>&gt; is=
 also inside the parentheses, still, we get the warning. Please let me know=
 if I am wrong here.<br><br></div><div>I checked those warnings. Some of th=
e patches are good cases to check if we can improve the heuristics on EXPOR=
T_SYMBOL().</div><div><br></div><div>E.g., commit bfdaf029c9c9 (&quot;ia64:=
 turn csum_partial_copy_from_user() into csum_and_copy_from_user()&quot;) l=
ooks sound to me, and <a href=3D"http://checkpatch.pl">checkpatch.pl</a> sh=
ould not really=C2=A0warn about that.</div><div><br></div><div>Mrinal, mayb=
e you can find out why <a href=3D"http://checkpatch.pl">checkpatch.pl</a> b=
elieves that this case is wrong and needs to be warned about?</div><div><br=
></div><div><br></div><div>Lukas</div></div>

--00000000000097f98b05aa1d485d--

--===============6876526797632469384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6876526797632469384==--
