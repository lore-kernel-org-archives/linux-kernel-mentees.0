Return-Path: <SRS0=iE2U=IX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CF8C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 12:56:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 984C4619BF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 12:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 984C4619BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=slateberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F6C540F4A;
	Thu, 25 Mar 2021 12:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeGi-Wl58AYD; Thu, 25 Mar 2021 12:56:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8F340F48;
	Thu, 25 Mar 2021 12:56:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA659C000E;
	Thu, 25 Mar 2021 12:56:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52174C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 12:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40C0660752
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 12:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=slateberry.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-wh_xXHHyn4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 12:56:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6FB9606D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 12:56:03 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id w2so1547696ilj.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=slateberry.com; s=google;
 h=mime-version:from:in-reply-to:references:date:message-id:subject:to;
 bh=ANud+DwyQzYlYC7JUSKymKrrjQFp5bIA/i1HrFWgQ1A=;
 b=mwERoaWUKvU4QUCMutBLT+Pip8BPHyDoo7mlaY3+E2aCFAXrqq8q60AqpiPealjO0W
 FHAFDQUws273O0OUt1C2UyBjLnyMjlCyi+x1l9VFKmZ7DgLmiE+iuQ83TqBdl2cHfKVX
 ttHkbzYGik9ZiKqrvSC3J2D8cR+YRrX3Py2MvZQ1hE8B41RmkCuSkVIc8/3c86618QIr
 BCktriRhoxyR/VxkBRessN8xsLbxmKYYKm+FY7PMvoivNVAT+jLOfTEK0zRvhfCfgSu3
 6JB0x0p/RoWrirLoETzQu6TDjJFwT1hhcn8NBZEfDJalkpBdnn6pJ/dobXDKdwn2YU5E
 1I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:in-reply-to:references:date
 :message-id:subject:to;
 bh=ANud+DwyQzYlYC7JUSKymKrrjQFp5bIA/i1HrFWgQ1A=;
 b=ceHOLQQRcPdPF5rU54CfR581gh+UwpUVM4ytGTOOTg49vD4DBjKfPm50Vt/IB5rugg
 0ksLfzjIIbB61e0lwtgS1mVq0XQiIFLvnXrvsJnAflhwHAA2OnybPJMcUy3qGGZ3MC66
 PMYxDkCc4nh3VaE+mwxhLD98Gon5v8tQw0A1AgXnICpB3CVtmGyqVsJEXjh7V/yGcVCO
 gdNT6FX9aMuf4gBd3IXPf1OZ8q+f+3SAUyRMQVezL/s0vIcUerFcamUKrlIgrVZTSODx
 WHMS4MJFKi64QZ3XHcA6ZMUHf+k0I6Ad9MVaHcxJfOyXXOW7F9NoJESLodoVIeQYIUlz
 mF2w==
X-Gm-Message-State: AOAM5302lJgqr5+z9KbJWh9FoYozBmFezmv+bXuIoPzMxW8S6YQ4aCLv
 EMLhrzj65wiiRwYxY+iovB4MkwcYy3XfQtOR4IsUjpzzEtQ=
X-Google-Smtp-Source: ABdhPJxIVKfRKSrby5A7jUhHL39GgZOggxB2JLCx4D99lpFs++hU898/c9IuXOWNpK9nUd2fwSsW9UtPpc/z0twQYOo=
X-Received: by 2002:a92:bd0c:: with SMTP id c12mr6405813ile.55.1616676962790; 
 Thu, 25 Mar 2021 05:56:02 -0700 (PDT)
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Mar 2021 05:56:02 -0700
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 25 Mar 2021 05:51:03 -0700
Received: from 776393159873 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Mar 2021 07:30:26 -0700
MIME-Version: 1.0
From: Lauren Harris <lharris@slateberry.com>
In-Reply-To: <CA+B_sTDeZ_Ae=hBwpSowDOEoAZKTfkt1APtzDSFnDFqCQGvY3w@mail.gmail.com>
References: <CA+B_sTDeZ_Ae=hBwpSowDOEoAZKTfkt1APtzDSFnDFqCQGvY3w@mail.gmail.com>
Date: Thu, 25 Mar 2021 05:56:02 -0700
Message-ID: <CA+B_sTD0yHzKX82HVSuFkHcQXzHBVc31aF0nd_dOTLOO=uVY1g@mail.gmail.com>
Subject: Re: Redirected link on lists.linuxfoundation.org
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============4861819971700955098=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4861819971700955098==
Content-Type: multipart/alternative; boundary="000000000000157add05be5bf0ea"

--000000000000157add05be5bf0ea
Content-Type: text/plain; charset="UTF-8"

I wanted to check in and see if you got my note about the broken link on
your site?

Thanks,
-Lauren

On Monday, March 22, 2021 at 7:32 AM, Lauren Harris <lharris@slateberry.com>
wrote:

> I noticed that your old link to the Multibit Bitcoin wallet (Multibit.org)
> now gets redirected to a page on Github.com. (KeepKey, the company that
> bought Multibit, redirected the site to that page).
>
> That would be a good link if all your readers were hard-core developers
> looking to restart that project.  But, given that the Multibit project has
> been shut down, most of your readers are probably looking for historical
> information or a suggestion on how to get their Bitcoin into a new wallet.
>
> You link to Multibit.org here:
> lists.linuxfoundation.org/pipermail/bitcoin-dev/2013-June/002837.html
>
> We just published an article that explains Multibit's history, including
> background on the founders, the project's acquisition and how
> wallet holders can move forward now.  I think it's an interesting story,
> and it could be useful to your readers.
>
> Here's the article if you want to take a look:
> https://cryptoassetrecovery.com/2021/02/19/multibit-cryptocurrency-wallet/
>
> Would you consider adding a link to our article on your post?
>
> Thanks,
> -Lauren
>
> --
> Lauren Harris, Editor
> 5 Ross Rd
> Durham, NH 03824
>
> BTW, if you didn't like getting this email, please reply with something
> like "please don't email me anymore", and I'll make sure that we don't.
>

--000000000000157add05be5bf0ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wanted to check in and see if you got my note about the broken link on yo=
ur site? <br><br>Thanks,<br>-Lauren
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Monday, March =
22, 2021 at 7:32 AM, Lauren Harris &lt;<a href=3D"mailto:lharris@slateberry=
.com">lharris@slateberry.com</a>&gt; wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I n=
oticed that your old link to the Multibit Bitcoin wallet (Multibit.org) now=
 gets redirected to a page on Github.com. (KeepKey, the company that bought=
 Multibit, redirected the site to that page).<br></div><div><br></div><div>=
That would be a good link if all your readers were hard-core developers loo=
king to restart that project.=C2=A0 But, given that the Multibit project ha=
s been shut down, most of your readers are probably looking for historical =
information or a suggestion on how to get their Bitcoin into a new wallet.=
=C2=A0=C2=A0</div><div><div><br></div></div><div><div>You link to Multibit.=
org here: <a href=3D"http://lists.linuxfoundation.org/pipermail/bitcoin-dev=
/2013-June/002837.html">lists.linuxfoundation.org/pipermail/bitcoin-dev/201=
3-June/002837.html</a></div></div><div><div><br></div></div><div><div>We ju=
st published an article that explains Multibit&#39;s history,=C2=A0includin=
g background on the founders,=C2=A0the project&#39;s acquisition and how wa=
llet=C2=A0holders can move forward now.=C2=A0 I think it&#39;s an interesti=
ng story, and it could be useful to your readers.</div></div><div style=3D"=
color:rgb(80,0,80)"><div><br></div></div><div><div>Here&#39;s the article i=
f you want to take a look: <a href=3D"https://cryptoassetrecovery.com/2021/=
02/19/multibit-cryptocurrency-wallet/" target=3D"_blank">https://cryptoasse=
trecovery.com/2021/02/19/multibit-cryptocurrency-wallet/</a></div></div><di=
v style=3D"color:rgb(80,0,80)"><div><br></div></div><div><div>Would you con=
sider adding a link to our article on your post?</div></div><div><div><br><=
/div></div><div><div>Thanks,</div></div></div></div></div></div></div></div=
><div dir=3D"ltr"><div><div><div style=3D"margin:2px 0px 0px"><div id=3D"gm=
ail-m_-6148779891664430970m_-1084495376646659447m_-4668798218014470695gmail=
-m_-408491972067746283m_3488138788388989778m_7384179102769867055gmail-m_248=
414742104681395m_-4881172833632138526gmail-m_4540721236450369149m_-67905413=
80631623199m_-6818611334724111342m_7108229142253841330m_6970731877949862732=
m_8268863430003288276gmail-:43h"><font face=3D"arial, sans-serif">-Lauren</=
font></div></div></div></div></div></div><div dir=3D"ltr"><div><div><br></d=
iv></div><div><div><div style=3D"margin:2px 0px 0px"><div id=3D"gmail-m_-61=
48779891664430970m_-1084495376646659447m_-4668798218014470695m_788574557873=
7468192m_7384179102769867055gmail-m_248414742104681395m_-488117283363213852=
6gmail-m_4540721236450369149m_-6790541380631623199m_-6818611334724111342m_7=
108229142253841330m_6970731877949862732m_8268863430003288276gmail-:43h">--<=
/div><div id=3D"gmail-m_-6148779891664430970m_-1084495376646659447m_-466879=
8218014470695m_7885745578737468192m_7384179102769867055gmail-m_248414742104=
681395m_-4881172833632138526gmail-m_4540721236450369149m_-67905413806316231=
99m_-6818611334724111342m_7108229142253841330m_6970731877949862732m_8268863=
430003288276gmail-:43h">Lauren Harris, Editor</div><div id=3D"gmail-m_-6148=
779891664430970m_-1084495376646659447m_-4668798218014470695m_78857455787374=
68192m_7384179102769867055gmail-m_248414742104681395m_-4881172833632138526g=
mail-m_4540721236450369149m_-6790541380631623199m_-6818611334724111342m_710=
8229142253841330m_6970731877949862732m_8268863430003288276gmail-:43h">5 Ros=
s Rd</div><div id=3D"gmail-m_-6148779891664430970m_-1084495376646659447m_-4=
668798218014470695m_7885745578737468192m_7384179102769867055gmail-m_2484147=
42104681395m_-4881172833632138526gmail-m_4540721236450369149m_-679054138063=
1623199m_-6818611334724111342m_7108229142253841330m_6970731877949862732m_82=
68863430003288276gmail-:43h">Durham, NH 03824</div><div id=3D"gmail-m_-6148=
779891664430970m_-1084495376646659447m_-4668798218014470695m_78857455787374=
68192m_7384179102769867055gmail-m_248414742104681395m_-4881172833632138526g=
mail-m_4540721236450369149m_-6790541380631623199m_-6818611334724111342m_710=
8229142253841330m_6970731877949862732m_8268863430003288276gmail-:43h"><br><=
/div><div id=3D"gmail-m_-6148779891664430970m_-1084495376646659447m_-466879=
8218014470695m_7885745578737468192m_7384179102769867055gmail-m_248414742104=
681395m_-4881172833632138526gmail-m_4540721236450369149m_-67905413806316231=
99m_-6818611334724111342m_7108229142253841330m_6970731877949862732m_8268863=
430003288276gmail-:43h">BTW, if you didn&#39;t like getting this email, ple=
ase reply with something like &quot;please don&#39;t email me anymore&quot;=
, and I&#39;ll make sure that we don&#39;t.=C2=A0<img src=3D"https://ssl.gs=
tatic.com/ui/v1/icons/mail/images/cleardot.gif"></div></div></div></div></d=
iv></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<img src=3D"http://email.slateberry.com/d8I7pBRrJuxaIwZfRUDtnC6MxC0X2KlQJIl=
IsmNSBHIWxigm2nrpH_jzd961x5Y5xDrhqC2yslt0PV2bWNOGw9etedzbF0l7x33GEscoMU_nxM=
LFvQCOVByVR0eYBD1Rb0RVFweNnyvkxQBWJJ_Ku0t9bWqLnyaoPCIp4gCIeR0f6axtVZDA9EClT=
UzKhDzKh56CtatpwqXvjYjz"></blockquote></div><br></div><img src=3D"http://em=
ail.slateberry.com/F9y6-v3HrB2jCS8zN8W8V35_BED_ieBsahebDkhp5pyA_cBcebJblUo4=
UGcDBRRYk6tNn4unQhs9NkYg8erVY4OAJwDCA2-G6PEWcYNy6NMpO9dbvy4vUF0CT2C9QPjVbwC=
Rq5PyJB2zewmayH_LA2c8wVHRUG9E0JDRKMX1N98MIvwdqJ4p_c6JHY1YIB8hnfM3-qbkMq1bu2=
GsXg9B5vsQz8fX1XYBDN37z_fpZZ">

--000000000000157add05be5bf0ea--

--===============4861819971700955098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4861819971700955098==--
