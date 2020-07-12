Return-Path: <SRS0=cUZQ=AX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=BAYES_05,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562B5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 07:18:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F22F2065F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 07:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZ/LSrVT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F22F2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AE21E203B0;
	Sun, 12 Jul 2020 07:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id USRqLWZsZD0r; Sun, 12 Jul 2020 07:18:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8F4F820445;
	Sun, 12 Jul 2020 07:18:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 744A7C088E;
	Sun, 12 Jul 2020 07:18:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D2E8C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 07:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 244AC88E2C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 07:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXpUCZRuPG+3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 07:18:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AD47488E27
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 07:18:47 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id l1so10305582ioh.5
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 00:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yG1pahNzbMAPYy42ALb72+WSdCrPtx9HHEWdOjujfbM=;
 b=cZ/LSrVT+6aNxSC/xLgsy21Wi/cxerf3AyaldpRngSbv6zlOWV3pJbSMA+W8JqoZrB
 JHY3itDFz6Tl+nnV4K8MSrc2o/gI7o/XKi+hEuNciTvM6svCcWvqmF3hLatYFdaJWbSe
 +jrwhYDRZ3OZ5xa6YNNAiabj4QVdFno9iSiI94n26Dq7tOi1IOxRgqOjXKtZdi08xMKN
 nmIlRWP4RmzOhmNa29CrY3r7X+DpdhtaG5HJkuTCe2me7smik06eXGG2lBYRc9wY6QvO
 5C/XjiFeTC0prHHf/JznNuJW0PxBbdt41UiJEdRh7+2GFjPy2TC3NMpIXnsWxZHRI1tm
 FDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yG1pahNzbMAPYy42ALb72+WSdCrPtx9HHEWdOjujfbM=;
 b=as4XFbau6Q0L7pUzQK2jrlfcFdsEyfswEAX+jRdCB8BAWZNo0xJrd/Ty4w9F/ORZSr
 jaVsCMggTumLlZODlBNDUa+5SG9HNLXGujtZls+E/ldTMPnjIwq8jGMFjxBpOnBglJd6
 irKkU1s9abG/g9r0RvIj0BFzQjHTKI6r3+23RC9hghxnkhuemPJhaeog7p+TvwUNBZdP
 bxXSAeQiarW0OGBjTAvKaIS63HvCbfxjH0ToWEmhLrK5XxeRqg+FOck32WAqBiCMekfT
 u8WSOzyf7Ov7PZxoNnSvgrWd1an0PaC4A8U59MOIkhfHcs1R+6BlfuYNR1cU57opxIx7
 aVDw==
X-Gm-Message-State: AOAM532ixjetV1EdIV6sI4gW8BR3m1DAEyAX0TDkNXbLIS5YmTCIlIta
 xVY3LEnbeVf1lxaiQ34vss5ggGVeHuPhWBWdJCw=
X-Google-Smtp-Source: ABdhPJzDd0KO7vdEfelFzSHHcX9KNMs3N7ch83s/43n6PTuL1pvmrxpx0rToMrscn3F+PPb0McBRTp/dbJTdlCsx6nI=
X-Received: by 2002:a6b:5c07:: with SMTP id z7mr56810358ioh.140.1594538326984; 
 Sun, 12 Jul 2020 00:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200711154415.34w6ndu24uodj3ba@mrinalpandey>
 <CAKXUXMwE+23QnzLyNegXmSSdUeXC8Wv8ZzrBke7KON35kRqfqg@mail.gmail.com>
 <CAD1=X6kLBAAMqMH+bZipagmVq4XHx4LOVB=yUb1J870NgXMCUg@mail.gmail.com>
In-Reply-To: <CAD1=X6kLBAAMqMH+bZipagmVq4XHx4LOVB=yUb1J870NgXMCUg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 12 Jul 2020 09:18:36 +0200
Message-ID: <CAKXUXMzXiHCk9bJYK84WhL7FKRqV7YKmQ8_EJZgU_wTjiui8Tg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6050648443596555777=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6050648443596555777==
Content-Type: multipart/alternative; boundary="0000000000008f89b205aa396228"

--0000000000008f89b205aa396228
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 12, 2020 at 7:18 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:

> On Sun, Jul 12, 2020 at 12:44 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
>
>>
>>
>> On Sat, Jul 11, 2020 at 5:44 PM Mrinal Pandey <mrinalmni@gmail.com>
>> wrote:
>>
>>> The usage of "capture group (...)" in the immediate condition after `&&`
>>> results in `$1` being uninitialized. This eventually crashes the script.
>>>
>>>
>> It does not really crash it, right? It just emits a warning.
>>
>
> Sir,
>
> Yes. I will modify the line accordingly.
>
>>
>>
>>> Fix this by placing the capture group in the condition before `&&`.
>>> Thus, `$1` can be initialized to the text it matches thereby setting it
>>> to the desired and required value.
>>>
>>>
>> Maybe you can look when this bug was introduced?
>>
>
> The bug was first introduced with the commit `e518e9a59ec3` when the block
> was
> added to the script. It has been like that since then.
> Should I add this detail too in the commit message?
>

Yes, please do.

Commits are referred to with its hash shortened to 12 characters and the
commit message header in the following format:

Commit e518e9a59ec3 ("checkpatch: emit an error when there's a diff in a
changelog")


Further note:
- can you also explain what the author intended to do?
- can you describe in one sentence how you discovered this bug?
- use checkpatch.pl on your own patch.

Please rework the commit message and resend to this list, Shuah and me.

I think if that patch is then okay, we have a quick look and then you can
send it out to the general list.


Lukas

>

--0000000000008f89b205aa396228
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 12, 2020 at 7:18 AM Mrina=
l Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com" target=3D"_blank">mrina=
lmni@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Sun, Jul 12, 2020 at 12:=
44 AM Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com" target=
=3D"_blank">lukas.bulwahn@gmail.com</a>&gt; wrote:<br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, Jul 11, 2020 at 5:44 PM Mrinal Pandey &lt;=
<a href=3D"mailto:mrinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The usage of &quot;capture group (...)&quot; in the immediate condition af=
ter `&amp;&amp;`<br>
results in `$1` being uninitialized. This eventually crashes the script.<br=
>
<br></blockquote><div><br></div><div>It does not really crash it, right? It=
 just emits a warning.</div></div></div></blockquote><div><br></div><div>Si=
r,</div><div><br></div><div>Yes. I will modify the line accordingly.<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
Fix this by placing the capture group in the condition before `&amp;&amp;`.=
<br>
Thus, `$1` can be initialized to the text it matches thereby setting it<br>
to the desired and required value.<br>
<br></blockquote><div><br></div><div>Maybe you can look when this bug was i=
ntroduced?</div></div></div></blockquote><div><br></div><div>The bug was fi=
rst introduced with the commit `e518e9a59ec3` when the block was</div><div>=
added to the script. It has been like that since then.</div><div>Should I a=
dd this detail too in the commit message?<br></div></div></div></blockquote=
><div><br></div><div>Yes, please do.</div><div><br></div><div>Commits are r=
eferred to with its hash shortened to 12 characters and the commit message =
header in the following format:</div><div><br></div><div>Commit e518e9a59ec=
3 (&quot;checkpatch: emit an error when there&#39;s a diff in a changelog&q=
uot;)<br></div><div><br></div><div><br></div><div>Further note:</div><div>-=
 can you also explain what the author intended to do?</div><div>- can you d=
escribe in one sentence how you discovered this bug?</div><div>- use <a hre=
f=3D"http://checkpatch.pl" target=3D"_blank">checkpatch.pl</a> on your own =
patch.<br></div><div><br></div><div>Please rework the commit message and re=
send to this list, Shuah and me.<br></div><div><br></div><div>I think if th=
at patch is then okay, we have a quick look and then you can send it out to=
 the general list.</div><div><br></div><div><br></div><div>Lukas</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div>
</blockquote></div></div>

--0000000000008f89b205aa396228--

--===============6050648443596555777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6050648443596555777==--
