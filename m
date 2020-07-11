Return-Path: <SRS0=lv87=AW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12865C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Jul 2020 19:14:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB15820725
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Jul 2020 19:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhJy+O9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB15820725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7EAE123424;
	Sat, 11 Jul 2020 19:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddmnxD486ZFv; Sat, 11 Jul 2020 19:14:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 383C62272C;
	Sat, 11 Jul 2020 19:14:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F8D3C077B;
	Sat, 11 Jul 2020 19:14:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C39D9C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 19:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E2CC42272C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 19:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1ugLQj0v7Ca
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 19:14:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by silver.osuosl.org (Postfix) with ESMTPS id B6B1B226E9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 19:14:12 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q8so9452276iow.7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jul 2020 12:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B0BW6XP9M0HGNTOcsxJKTkP3Ga+WF+4av37OWxrzYk0=;
 b=HhJy+O9BPG27QCNwCGO8FNgEE93afbCcSD+jJUJC4bWCQpST1JQ0GZAgvpbfzPwrR/
 DmMlpnew+sxk/tz4eG6nVAUpKUmkQPoZMrrXBglJTDTSEalWWgPHZLosyPPIUnt+6B3p
 GwSW89VNXcmuSotXEekvcVOUEIUc4nM8zNwBlbvUDJbVOIR/nzvsg+JmLX7+Fq6LBujM
 TS1ESiFLcmCw5rgpw3n+dobNgfq6PGk1g5ZLs5QQCIG2akGp+/inIXGTNjyLP8cx+76O
 4VSRt1PcotdvqOZNmTddNyTffd9yuv6Y1MZ0HqhpbLEvF80kQbwzBR57gGMVTF1v8mJA
 Dl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B0BW6XP9M0HGNTOcsxJKTkP3Ga+WF+4av37OWxrzYk0=;
 b=N8aPnEeEctDPl1jekwYDjHf1W3Nn5iIt3YdQCySq3UtOO/71J/GQzt/+LW+ohJP98s
 5pV7O0sNVGth4hiRGf8Xw0vViq5DQ1IzoyDOpGJFurAP1hxgdFJgM4GDctOVwXY6QY5W
 st7f273k6hwW9WTqk5Yzy8dO/rdW+7TaAIhUfgBwNV1XZ+Pw3OYt/pdJRrch2TD6k91/
 r0J1C+r5GRcyEP71r5nmZCBDvbiX2tuxzDY4Q83FAgDlVUa/U96LjqxC9OR/fk5miMo7
 SzJPmyAaKg35V0W8ntJrQPOLphXIfvdHMge/tWk/GTJSbqDJq+B/LyFD8xXK0MagMQ+k
 dCKA==
X-Gm-Message-State: AOAM532xQADI5uthVg3NWNyQdrbQstug0VwauVtH1G/L1upOhsckLZKM
 iiX9L8CmWdAfb0VWMS31JAF/0QfuO8W++l/UkzY=
X-Google-Smtp-Source: ABdhPJzLQCJuISOPl3tZy/Y/0ejPj7/VXErIhyBMvAthp0s3buHRlIQF1xmMksYTbtMUXmvsEpXiZVlZ5sPd1KSPD5Y=
X-Received: by 2002:a05:6638:252:: with SMTP id
 w18mr72002786jaq.42.1594494851997; 
 Sat, 11 Jul 2020 12:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200711154415.34w6ndu24uodj3ba@mrinalpandey>
In-Reply-To: <20200711154415.34w6ndu24uodj3ba@mrinalpandey>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 11 Jul 2020 21:14:01 +0200
Message-ID: <CAKXUXMwE+23QnzLyNegXmSSdUeXC8Wv8ZzrBke7KON35kRqfqg@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix the usage of
	capture group ( ... )
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
Content-Type: multipart/mixed; boundary="===============0446894054946682883=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0446894054946682883==
Content-Type: multipart/alternative; boundary="0000000000003ff95005aa2f43e1"

--0000000000003ff95005aa2f43e1
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 11, 2020 at 5:44 PM Mrinal Pandey <mrinalmni@gmail.com> wrote:

> The usage of "capture group (...)" in the immediate condition after `&&`
> results in `$1` being uninitialized. This eventually crashes the script.
>
>
It does not really crash it, right? It just emits a warning.


> Fix this by placing the capture group in the condition before `&&`.
> Thus, `$1` can be initialized to the text it matches thereby setting it
> to the desired and required value.
>
>
Maybe you can look when this bug was introduced?

Lukas

--0000000000003ff95005aa2f43e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 11, 2020 at 5:44 PM Mrina=
l Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com">mrinalmni@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
usage of &quot;capture group (...)&quot; in the immediate condition after `=
&amp;&amp;`<br>
results in `$1` being uninitialized. This eventually crashes the script.<br=
>
<br></blockquote><div><br></div><div>It does not really crash it, right? It=
 just emits a warning.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Fix this by placing the capture group in the condition before `&amp;&amp;`.=
<br>
Thus, `$1` can be initialized to the text it matches thereby setting it<br>
to the desired and required value.<br>
<br></blockquote><div><br></div><div>Maybe you can look when this bug was i=
ntroduced?</div><div><br></div><div>Lukas</div></div></div>

--0000000000003ff95005aa2f43e1--

--===============0446894054946682883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0446894054946682883==--
