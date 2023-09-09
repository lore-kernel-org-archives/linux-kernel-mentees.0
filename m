Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CDEEE14AA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 Sep 2023 18:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED78E408A3;
	Sat,  9 Sep 2023 18:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED78E408A3
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z3UlvwIc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COfsZv7AmPPQ; Sat,  9 Sep 2023 18:56:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EA9124012F;
	Sat,  9 Sep 2023 18:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA9124012F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1972C0039;
	Sat,  9 Sep 2023 18:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06241C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Sep 2023 18:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE00060E77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Sep 2023 18:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE00060E77
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Z3UlvwIc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wuVqlWxA5cJC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Sep 2023 18:56:33 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A04C960BAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Sep 2023 18:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A04C960BAD
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcde83ce9fso52277601fa.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 09 Sep 2023 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694285790; x=1694890590;
 darn=lists.linuxfoundation.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EdhRqSfa6khfrSSU/N2IbJd87aV1RvQQJ6zAso++CbI=;
 b=Z3UlvwIc2C+ni0BgniN6dTi9LBbS9yfdQmHWwxMUMbTf9uM/0g804UbONcSuEJaPpI
 0oxxHRdQbUpUe9qTbW+zupqkFLn9auSIXiiJgFDCS7bGaO75sPNoXF7pMXkUcmUR41Qd
 RipHHcv2vevkYmJmlv6pCJyHZ3BRZIrHiSk+4refT/+A7efL3J+SlYkYlRtl/lxCZNFl
 0O4u5UGCDzQtoRRLEzExKwF3A3vFz36Yo6jO4yg6fVxld2VaLlGBg/QmMLmtArYOTgEz
 9ns2RWwK4f5Oe8qveRHtQUFKypb78o/ghkinrlLXSFkxNz0YY4AcMsDgTkRp314nWCCd
 sO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694285790; x=1694890590;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EdhRqSfa6khfrSSU/N2IbJd87aV1RvQQJ6zAso++CbI=;
 b=KSXTwc5pE0olYijIfVf1Ckd4V2g4L/cVvclb09vHZ5USAHMSE57TGJR/XWs714kMsC
 5oIEnYXmTlaJbgBVZEt6DF0WIuZOJ75sENghPEvX5T9LSGCk8EyZjZf51MnO/398rWBe
 olc03mjh/1b3VLgzCkQ9GA4NQR9s8QWTUq6DIlGudwwsvTY7f92eS3wrb2k1RJ+BRvHD
 VxQ789L6CCXbpwpF4asPdgjdcPBjgN/93hm07MC6am30U4nihjwPau+1/t7tjPM5CrG9
 rgiqwUJa08uVoVnjTffaKDciKpeLHP3DjnnNUTS6LByfO5dxTqhuxseaWHdbtUblP13e
 TCRw==
X-Gm-Message-State: AOJu0YxBNRjDlOfNV6O/qsLp4B6b9ufkyz4G4PAHMM1XCthVg6HWTcUh
 d/PmV4fyMcIsHCzkgmNeC+N60yXJCd5JjnQRGFI=
X-Google-Smtp-Source: AGHT+IFqVIgfvw+StBBG0bQ69GpJ/YEFZ59n8hMjFso6mdJ765/EqI/sBwBfmKkQgRBYeYRTsi/FnTXNJJqy3//g6MI=
X-Received: by 2002:a2e:501e:0:b0:2bf:6852:9343 with SMTP id
 e30-20020a2e501e000000b002bf68529343mr3814948ljb.12.1694285789856; Sat, 09
 Sep 2023 11:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230906193922.nqmrdvqd4otbqls2@debian.org>
In-Reply-To: <20230906193922.nqmrdvqd4otbqls2@debian.org>
From: Nikita B <n2h9z4@gmail.com>
Date: Sat, 9 Sep 2023 20:56:17 +0200
Message-ID: <CAJVoGU0qwY1AHU9Y_bxXKtPTFOtpYewyNG-ahKEBykf_XJmzgA@mail.gmail.com>
Subject: Re: [RFC] A simple workflow to work with syzbot bugs
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============5626012840928068954=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5626012840928068954==
Content-Type: multipart/alternative; boundary="000000000000a7087a0604f1a648"

--000000000000a7087a0604f1a648
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Ricardo!

That actually looks very good =F0=9F=99=82
I find this manual very useful. Thank you for sharing with us! =F0=9F=98=87

Thank you,
kind regards, Nikita!

On Wed, 6 Sept 2023 at 21:54, Ricardo B. Marliere <ricardo@marliere.net>
wrote:

> Hello mentors and mentees,
>
> I just posted a mini guide on the basics of investigating bugs reported
> by syzbot:
> https://marliere.net/~ricardo/2023/09/06/simple-workflow.html
>
> This is the way I'm gonna be working and it would be very good to
> receive comments from you all to compare notes and also improve the
> workflow!
>
> Thanks,
> -       Ricardo
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>

--000000000000a7087a0604f1a648
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, Ricardo!=C2=A0</div><div><br></div><div>That a=
ctually looks very good=C2=A0=F0=9F=99=82</div><div>I find this manual very=
 useful. Thank you for sharing with us!=C2=A0=F0=9F=98=87</div><div><br></d=
iv><div>Thank you,=C2=A0</div><div>kind regards, Nikita!=C2=A0</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 6 Sept 2023 at 21:54, Ricardo B. Marliere &lt;<a href=3D"mailto:ricardo@ma=
rliere.net">ricardo@marliere.net</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello mentors and mentees,<br>
<br>
I just posted a mini guide on the basics of investigating bugs reported<br>
by syzbot:<br>
<a href=3D"https://marliere.net/~ricardo/2023/09/06/simple-workflow.html" r=
el=3D"noreferrer" target=3D"_blank">https://marliere.net/~ricardo/2023/09/0=
6/simple-workflow.html</a><br>
<br>
This is the way I&#39;m gonna be working and it would be very good to<br>
receive comments from you all to compare notes and also improve the<br>
workflow!<br>
<br>
Thanks,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Ricardo<br>
_______________________________________________<br>
Linux-kernel-mentees mailing list<br>
<a href=3D"mailto:Linux-kernel-mentees@lists.linuxfoundation.org" target=3D=
"_blank">Linux-kernel-mentees@lists.linuxfoundation.org</a><br>
<a href=3D"https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-=
mentees" rel=3D"noreferrer" target=3D"_blank">https://lists.linuxfoundation=
.org/mailman/listinfo/linux-kernel-mentees</a><br>
</blockquote></div>

--000000000000a7087a0604f1a648--

--===============5626012840928068954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5626012840928068954==--
