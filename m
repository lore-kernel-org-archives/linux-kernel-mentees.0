Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE0AE748E9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Oct 2023 17:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB01A820F1;
	Sun,  1 Oct 2023 17:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB01A820F1
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gVqDhP3d
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id koKFAxP_0zYY; Sun,  1 Oct 2023 17:32:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ADD19820F2;
	Sun,  1 Oct 2023 17:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD19820F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF45C0039;
	Sun,  1 Oct 2023 17:32:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 016B6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 17:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C26B341961
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 17:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C26B341961
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gVqDhP3d
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGyvqZ0x5Upj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 17:32:25 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6AD141D9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Oct 2023 17:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6AD141D9E
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9b2d64c9307so90915766b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Oct 2023 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696181543; x=1696786343;
 darn=lists.linuxfoundation.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=we3e5kSkpP5rDA8lM2ugzJT1PsRTrEqF+I696p7zYqY=;
 b=gVqDhP3dxI9VVELrTPya3gtut0YTMiOicFwx2xQUJKwYaPe6IR5jGBAJu3uixbmtnp
 bQz/hKGrfbKUifLOnVIADmpQdGj0tTcASLzraD3r/5WC8sAP+zkeq9wxlgybqzh9/bOg
 zIOceQ7UsH+cOAbos6wFhXLORNkrQQeWuByZmxhCAjt+MKMOnSpX0WB9pR/i1+pMzMqA
 CyRXvNUvrwHFnqfVXK8gLt8N0ncVRJR4bZFbP4p9Qo/rtR6zIREiyz4FPkUyZR7WDtrR
 7btYxs5yZ/6dMY8EVac8A2uguLn6nNP1JrtraGUXL2NQWiavgvastjL7LuRptV9EOODt
 9wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696181543; x=1696786343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=we3e5kSkpP5rDA8lM2ugzJT1PsRTrEqF+I696p7zYqY=;
 b=Qtz8qXHa0WTGdv13sjBJ8xTCFLfEzJiUh4rAzLN2AGNMB/jpC7IZQfsRO4f/+qi7B3
 R0LAdf2djBxDyf8L03QJQWaLNSG4kwYgD9hqsZXttuJ7lcjh07mJ24xyQytISN6fvoUC
 YNujGbEpmj+ap17SDIhNhKBI4eDOgcpoU4+aNy7utlhiVNHMk0hMAmHHMx4UoGFisQKq
 r4HofG+D3+CycpkN+73UKTOi/6tlO7KW/Ddpa/jO80hAh7/sYYOiZB+jFI4uSYevmQqL
 LpN1NewUT+QKOzjJnP8T5y0xQCWzEsrCBUUMbR/XxcK6TDm5INl6y4sbBEsjelFrudos
 i2FA==
X-Gm-Message-State: AOJu0YxMZMiK0m0zCFLpQoMiaJiK9tguO/8cHilSFTzk/A2gsnIXww1G
 jV8skT0dFvCfuzv0o4RUNnTIVSrEQ43M5Fs6Wmc=
X-Google-Smtp-Source: AGHT+IGWHEDWL8AuLOY7PVeS1KcNQMBqmHhwR7CcZl3U1yid6P53mgJEFjeCk1zi/DXtO0BOOeonsT9Uul+POqdWQ0Q=
X-Received: by 2002:a17:906:74c1:b0:9ae:3ee2:6feb with SMTP id
 z1-20020a17090674c100b009ae3ee26febmr6777641ejl.2.1696181542503; Sun, 01 Oct
 2023 10:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230930194106.1379527-1-singhabhinav9051571833@gmail.com>
 <2023100135-stiffen-depress-8121@gregkh>
In-Reply-To: <2023100135-stiffen-depress-8121@gregkh>
From: Abhinav Singh <singhabhinav9051571833@gmail.com>
Date: Sun, 1 Oct 2023 23:02:11 +0530
Message-ID: <CAHvgv0Fsm2DzadwV2ECPWSvb2NDS-q06P8dcch=QEwE6+zLRvg@mail.gmail.com>
Subject: Re: [PATCH] Added missing TARGETS in kselftest top level Makefile
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============0951964195710351191=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0951964195710351191==
Content-Type: multipart/alternative; boundary="00000000000050d3cd0606ab0a57"

--00000000000050d3cd0606ab0a57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes I tested and saw that the targets I added was missing.
Reason for doing this is because I saw almost all dirs are included as
TARGETS inside Makefile and some dir where not included, so individually
tested whether the left out dirs are actual tests or not and if they are, I
added them.


Thank You,
Abhinav Singh

On Sun, Oct 1, 2023 at 11:37=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> On Sun, Oct 01, 2023 at 01:11:06AM +0530, Abhinav wrote:
> > Some TARGETS were missing in selftests top level Makefile.Added those.
> > Signed-off-by: Abhinav <singhabhinav9051571833@gmail.com>
>
> You need a blank line here please.
>
> Also, why make this change, you are saying what you did, but not why?
> Have you tested to verify that these targets were actually missing and
> needed to be added?  If so, for what reason?
>
> thanks,
>
> greg k-h
>

--00000000000050d3cd0606ab0a57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes I tested and saw that the targets I added was missing.=
<div>Reason for doing this is because I saw almost all dirs are included as=
 TARGETS inside Makefile and some dir where not included, so individually t=
ested whether the left out dirs are actual tests or not and if they are, I =
added them.</div><div><br></div><div><br></div><div>Thank You,</div><div>Ab=
hinav Singh</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sun, Oct 1, 2023 at 11:37=E2=80=AFAM Greg KH &lt;<a hre=
f=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, O=
ct 01, 2023 at 01:11:06AM +0530, Abhinav wrote:<br>
&gt; Some TARGETS were missing in selftests top level Makefile.Added those.=
<br>
&gt; Signed-off-by: Abhinav &lt;<a href=3D"mailto:singhabhinav9051571833@gm=
ail.com" target=3D"_blank">singhabhinav9051571833@gmail.com</a>&gt;<br>
<br>
You need a blank line here please.<br>
<br>
Also, why make this change, you are saying what you did, but not why?<br>
Have you tested to verify that these targets were actually missing and<br>
needed to be added?=C2=A0 If so, for what reason?<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--00000000000050d3cd0606ab0a57--

--===============0951964195710351191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0951964195710351191==--
