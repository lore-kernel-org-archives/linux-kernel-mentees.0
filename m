Return-Path: <SRS0=Sa9D=MI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9EEC12002
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Jul 2021 19:22:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC88F613F8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Jul 2021 19:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC88F613F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 869E240136;
	Fri, 16 Jul 2021 19:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-ILNyPKtxxP; Fri, 16 Jul 2021 19:22:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A1EE9400D5;
	Fri, 16 Jul 2021 19:22:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8512DC0010;
	Fri, 16 Jul 2021 19:22:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16CD1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 19:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F336640136
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 19:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeOVZJjbh24W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 19:22:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D17F400D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 19:22:53 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id e13so9282554ilc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Jul 2021 12:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=yvCHBN8DFiyZqRQJRplaUBFisoN4noeWOVlwphvFAOs=;
 b=SRLm5ZiWY6VPV+ycAChOPESJZ/PwQE43FdWsxzKIGtd/0AjHGgZt4tXacIMsrLO0ev
 JDhAESDIBT4RSmz6PHdf4Wsn4QfCxxPgGFa/DzIFg9rfDRPZn0z2rRJgdWACWlpzaIrV
 JD9LWL796HRzc9ZOMn5j15YdGXmxNFLAULuTbCLEtOktoS3FhM/b6yOwPp72vMGGxWhs
 WYcnCo/uSzxRp6Ser4XjoChJx71/zsWN3HWlRONqNiUyQ0Cs5Cp4EE8vZ3O97o5vEYDD
 fIFYWhjJ8Fz2QYAPyRdEYJOkqeL6rU7Wq0gQ/zhUmNr8WUdifWkKszaEFXG67Lp5oHcN
 O7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yvCHBN8DFiyZqRQJRplaUBFisoN4noeWOVlwphvFAOs=;
 b=eFvuOPMEkj3Ni7BdCdS6bwzIMCSBXw+Xe+ggri6rT0uN8fHqF8q3eg/s/vDhpYWWeo
 5ZuvONz1fdfrdE679HPD41xCTM2cul09cmzFJEitKG42KnqhQSaXb6Dkbmcwn95LPNv9
 +2Zjsoun8kNpxTr8RkJrKoMQ3g1jSA69D5CJ2a0YN2yp8ZSTf8sf1KHhjfjuHQagtQGQ
 YgKqauNxa3ri/CGsYDZnrNKEeIGZly3eBXzY5gxvOwuzNe5e3g/UV6ZaasfP3bjUZLuk
 TCNiFB8Gc0xCvASiC7FGWOeHHlbBf0/TEqFW5gCou2YHqE2W3wCm2Wlj/ZH3zH93QQyL
 yHbg==
X-Gm-Message-State: AOAM530zdl2wde+itTF5tHwhMcpEB38OlaZlSBR/fssEm0GGFq0mEXAH
 rTY2We9AxJhVgAJrMMwdrn/93pHgD8EuXSr8LdY=
X-Google-Smtp-Source: ABdhPJwUM5uB11td8bkZRcrn39krxTFEylOb+93YOpYbBaVOCcK2+RuC5nWip4vTQyTl7jZ96JZ+ab5e45MAqPB9hIw=
X-Received: by 2002:a92:c849:: with SMTP id b9mr7627293ilq.63.1626463372328;
 Fri, 16 Jul 2021 12:22:52 -0700 (PDT)
MIME-Version: 1.0
From: Abhinav Dubey <abhinavbhardwaj510@gmail.com>
Date: Sat, 17 Jul 2021 00:52:41 +0530
Message-ID: <CAFn3W_kg-Xk9z0qFJVVuUxzyPGevOe1w7nnammn3LvXFQq3g7Q@mail.gmail.com>
Subject: Mining Maintainers Mentorship program - Mentee Selection tasks
To: lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============3665201363284650412=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3665201363284650412==
Content-Type: multipart/alternative; boundary="0000000000008c45be05c74283ce"

--0000000000008c45be05c74283ce
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Thanks & Regards
Abhinav Dubey
Contact -  abhinavbhardwaj510@gmail.com

--0000000000008c45be05c74283ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Mining Maintainers mentorship program an=
d I would like to work on the tasks for the mentee selection.</span><br><di=
v><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helve=
tica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line"><br=
></span></div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,R=
oboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-sp=
ace:pre-line">Thanks &amp; Regards</span></div><div><span style=3D"color:rg=
b(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,san=
s-serif;font-size:12.8px;white-space:pre-line">Abhinav Dubey</span></div><d=
iv><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helv=
etica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">Co=
ntact -=C2=A0 <a href=3D"mailto:abhinavbhardwaj510@gmail.com" target=3D"_bl=
ank">abhinavbhardwaj510@gmail.com</a></span></div></div>

--0000000000008c45be05c74283ce--

--===============3665201363284650412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3665201363284650412==--
