Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1889C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:37:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C439120718
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:37:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDbevn9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C439120718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A39BD857DC;
	Sun,  1 Dec 2019 16:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TuEg0KfpfFqO; Sun,  1 Dec 2019 16:37:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1F71B8591D;
	Sun,  1 Dec 2019 16:37:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D713C1DE3;
	Sun,  1 Dec 2019 16:37:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2476FC1DEB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DB65584B82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VT-GePVwjuAb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:37:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 21DCA81DE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:37:34 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id p21so1156106vsq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4y1cMVE7kVeau+RABDn0TxsVYguftcnhPPVMl9zqRWQ=;
 b=PDbevn9GawZr1NskBktdX0c5SoFf09giIAujdClYqTikymI4xD+swPY5PXDrLCxa6e
 YvlmOeTzIFqqkpNM2sVeKd2tNWc88os3QdCfyc9NMcFaVSs0pSh0Q5GPLszyM9ewmY1R
 r4SBxQPVrQ2pXRQ8ACE/7r2wCYYd0mrA+hdOP4BNZnE5O0PomVx37jwv11d9tPv41LOt
 vHbF7OB5aU6rXIGkglthcQpiD/BQw8FuzzknOI285H6xQHKeBZZXm/AclmnByu88jYkh
 NSqQy5h0CVhTii1zzuvFQhAQrufnRre3jPccjQ6ykfJLiZDoZrgaCgw5KjfbCWqjvL5V
 dqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4y1cMVE7kVeau+RABDn0TxsVYguftcnhPPVMl9zqRWQ=;
 b=NJXKd4s9Fb1q+47/Kbai/nPnSbX637R+RX9KKUR5pSHeWBkVDYdwWzSpKCKqzgd1Gu
 fqmUYiQvRKwzQMDpD3F77XdC+pthTKH6awp+5UVdeaZdGHQrqNlzREAPCgMGiml14Pdo
 sE8Yc00yEOTWY0bzB4SWuVXU3EcovxtDdkn6uMiri5uHpDWad+qlyZalZ7Cq27pVuCpI
 9OPq9ej3UREV2w9Vjzxl2/hlWvQZUH4kVXU46nVegyTGDuvGPzTjYwDpRCtpNSRE6Pwq
 1j/L+nz78NqvycOPE/iHbB6PgqrgCmjAmj2R0fhqM/e2xVIe+Q0u6N4cfHlc0DM+X9fW
 dGNA==
X-Gm-Message-State: APjAAAUl028/6e4D80AFvXX4FjeEJyUSoPSAyqOrEuqe/eIa95qhNbM6
 QHH392sonyJ7r7pC4Ub7ZMFdI791phuYtPP3IKw=
X-Google-Smtp-Source: APXvYqxrx3xsUIAZ0+qCs98gUQgpR9+DHW1RO3LDbX3E2HzbsrG215ZJzjVt4nmPV0+d/7x/drZFqazUPiQFC6wSDa8=
X-Received: by 2002:a05:6102:3086:: with SMTP id
 l6mr7100617vsb.52.1575218253159; 
 Sun, 01 Dec 2019 08:37:33 -0800 (PST)
MIME-Version: 1.0
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-5-dwlsalmeida@gmail.com>
In-Reply-To: <20191201161542.69535-5-dwlsalmeida@gmail.com>
From: Amit Choudhary <amitchoudhary2305@gmail.com>
Date: Sun, 1 Dec 2019 22:07:22 +0530
Message-ID: <CAFzckaFfmVYV_baqV9bHrnguXfOKs42DJ2VgA4C1y2Ey-+99xQ@mail.gmail.com>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 4/6] media: dvb_dummy_fe: Fix
	long lines
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
Content-Type: multipart/mixed; boundary="===============7371482851445188275=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7371482851445188275==
Content-Type: multipart/alternative; boundary="0000000000006c61360598a71476"

--0000000000006c61360598a71476
Content-Type: text/plain; charset="UTF-8"

+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,

> +                                            u16 *strength)
>

In my opinion, the arguments on new line should be just below the start of
arguments on top line. Like this:

+static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
+                                                                     u16
*strength)



+               .caps = FE_CAN_FEC_1_2 |
> +                       FE_CAN_FEC_2_3 |
>

Similarly, here too and other places too:

+               .caps = FE_CAN_FEC_1_2 |
+                           FE_CAN_FEC_2_3 |

Regards,
Amit

--0000000000006c61360598a71476
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>+static int dvb_dummy_fe_read_signal_s=
trength(struct dvb_frontend *fe,</div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 u16 *strength)<br>
</blockquote><div><br></div><div>In my opinion, the arguments on new line s=
hould be just below the start of arguments on top line. Like this:<br></div=
><div><br></div><div>+static int dvb_dummy_fe_read_signal_strength(struct d=
vb_frontend *fe,<br></div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 u16 *strength)=C2=A0<=
/div><div><br></div><div><br></div><br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.caps =3D FE_CAN_FE=
C_1_2 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0FE_CAN_FEC_2_3 |<br></blockquote><div><br></div><div>Similarly, h=
ere too and other places too:</div><div><br></div><div>+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.caps =3D FE_CAN_FEC_1_2 |<br></div><=
div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 FE_CAN_FEC_2_3 |</div><div><br></div><div>R=
egards,<br></div><div>Amit</div><div><br></div></div></div>

--0000000000006c61360598a71476--

--===============7371482851445188275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7371482851445188275==--
