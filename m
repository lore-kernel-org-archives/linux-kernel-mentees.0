Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75113C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 12:08:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB158208B3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 12:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcCaYwvg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB158208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8262420402;
	Sat, 12 Sep 2020 12:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlDV4d5D7oCA; Sat, 12 Sep 2020 12:08:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 26398203B9;
	Sat, 12 Sep 2020 12:08:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 092AFC0859;
	Sat, 12 Sep 2020 12:08:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A383CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9355F85E06
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdXTdhCM7RNn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:08:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DEDCE857A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 12:08:40 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id n61so10643048ota.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGztqqer+rDApYggaYitZHmZOXOLPK6g/lDhiFvXv1w=;
 b=IcCaYwvgZLniibN8SmPdusfLjtv9Yh4XhetDi6X/Hm2XWa65Zomg0oz0Q2HchmUvkZ
 DZt19k3qcV71HdfAsLtaoiqEmW2jAJ0vRzZP7Y+lSvQWQr36wJWIz5SHaMxErKDC+/1L
 6ckXVZxd9sdCaQ38tlZ5QvY9lmOc87Vmmlwfei9/293aeYokqbnFuZq3d+3iCNj9okBu
 5b2rRM5FpPOwBtO8Y57vfhtB95kNOlMj/manh5mp+dtPtDAEKlGTLweXZehAflKBoyYf
 cEdzprN1fPOWHJpL/877Uz4ofKWqfIEUzuqYYIbctxaw9OxFyslcoUOC+E5187Ni+Lah
 Mo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGztqqer+rDApYggaYitZHmZOXOLPK6g/lDhiFvXv1w=;
 b=A6+gPtGGx1RKIlQU4D5xQziSSFeF4vyfYQoXkkG+AYLlCizuPcuN6CdPO2gRq+KmY9
 nFyu+p05US83HEw3O0jvSM52ZNqe9oalfDtD9gex1p+iT9YG6Xr7yybjhWN55rJl2SZ3
 Pd9KvKioD4NS0VXa5/lMLd6Vm9TnCY42WfnUsBrjcU0X3pk+FgiJVhodLQzGmCE/PYvO
 ck91ASVgxAVdg3CvUoy9vprTyjA9agF8rB9DC3OF/ZUjRWsl8WF1bRy3cH+mSHsuOP9S
 9TPPEHezC7sB6VlJ6oqW/sqUnYcq1grdXfrHPDbKhaD7Lv7ce/wDG3Ql3Cic8DoZQJym
 BQZg==
X-Gm-Message-State: AOAM532XBHabaQ/2KaFBR71VJ6ZpfzMx6QDn7WftfUsUdIdSwV9/+0hG
 vgQRlDC0axhReJRvWtTt//7uc2YdyI3x6Fc5FeY=
X-Google-Smtp-Source: ABdhPJw1yLYFIW3S69aL+0DdPf4UfxhP723ET1hDw/sZf18SsF4Uk8A/FMEUnmOYA+eoFAjzmNC8QTCPcEMEV5xINLo=
X-Received: by 2002:a05:6830:c4:: with SMTP id x4mr4156295oto.30.1599912519787; 
 Sat, 12 Sep 2020 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
In-Reply-To: <alpine.DEB.2.21.2009121252280.13082@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 12 Sep 2020 17:38:25 +0530
Message-ID: <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Content-Type: multipart/mixed; boundary="===============0348407073427963824=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0348407073427963824==
Content-Type: multipart/alternative; boundary="00000000000069ea7d05af1ca942"

--00000000000069ea7d05af1ca942
Content-Type: text/plain; charset="UTF-8"

> Hmm, your email client still seems to be broken :( If you answer to my
> email, it should use ">" not tabs. Maybe you can fix that.
>
> I looked at your scripts, I did not run them. They look as if they would
> do the job you claim they do. They are more complicated than needed, but
> it was not the task to find a simple solution. So, let us try them.
>
> Please have a look at this patch:
>
>
https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/
>
> The author states:
>
> This issue was discovered through a thorough analysis of checkpatch.pl
> errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and
> v5.8.
>
> Before applying this patch, checkpatch.pl reported 342 errors of type
> GIT_COMMIT_ID. After applying patch, errors reduced to 284.
>
>
> If your scripts work, you should be able to confirm the statement.
>
> The tasks are:
>
> 1. Run your scripts and create a full statistics of all error types with
> their according count for v5.7..v5.8.
>
> 2. Apply the patch with git am.
>
> 3. Run your scripts again and create a new statistics.
>
> 4. Compare before and after
>
> 5. Make all results available on your github repository.
>

Hi,
I think I got my email client working now.

The last time checkpatch.pl took awfully long to run on so many commits. :(
So, it might take a while but I will report my findings on this as soon
it is done processing.

Thanks,
Dwaipayan.

--00000000000069ea7d05af1ca942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><font color=3D"#741b47">&gt; Hmm, your email client st=
ill seems to be broken :( If you answer to my<br>&gt; email, it should use =
&quot;&gt;&quot; not tabs. Maybe you can fix that.</font><div><font color=
=3D"#741b47">&gt;<br>&gt; I looked at your scripts, I did not run them. The=
y look as if they would<br>&gt; do the job you claim they do. They are more=
 complicated than needed, but<br>&gt; it was not the task to find a simple =
solution. So, let us try them.<br>&gt;<br>&gt; Please have a look at this p=
atch:<br>&gt;<br>&gt; <a href=3D"https://lore.kernel.org/linux-kernel-mente=
es/20200912094826.150170-1-ayush@disroot.org/">https://lore.kernel.org/linu=
x-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/</a><br>&gt;<br>=
&gt; The author states:<br>&gt;<br>&gt; This issue was discovered through a=
 thorough analysis of <a href=3D"http://checkpatch.pl">checkpatch.pl</a><br=
>&gt; errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and=
<br>&gt; v5.8.<br>&gt;<br>&gt; Before applying this patch, <a href=3D"http:=
//checkpatch.pl">checkpatch.pl</a> reported 342 errors of type<br>&gt; GIT_=
COMMIT_ID. After applying patch, errors reduced to 284.<br>&gt;<br>&gt;<br>=
&gt; If your scripts work, you should be able to confirm the statement.<br>=
&gt;<br>&gt; The tasks are:<br>&gt;<br>&gt; 1. Run your scripts and create =
a full statistics of all error types with<br>&gt; their according count for=
 v5.7..v5.8.<br>&gt;<br>&gt; 2. Apply the patch with git am.<br>&gt;<br>&gt=
; 3. Run your scripts again and create a new statistics.<br>&gt;<br>&gt; 4.=
 Compare before and after<br>&gt;<br>&gt; 5. Make all results available on =
your github repository.<br>&gt;</font><br><br></div><div><div><font color=
=3D"#000000">Hi,</font></div><div>I think I got my email client working now=
.</div><div><br></div><div>The last time <a href=3D"http://checkpatch.pl">c=
heckpatch.pl</a> took awfully long to run on so many commits. :(=C2=A0</div=
><div>So, it might take a while but I will report my findings on this as so=
on=C2=A0</div><div>it is done processing.</div><div><br></div><div>Thanks,=
=C2=A0</div><div>Dwaipayan.</div></div></div>

--00000000000069ea7d05af1ca942--

--===============0348407073427963824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0348407073427963824==--
