Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674FEEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 12:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD54C423F3;
	Thu, 17 Aug 2023 12:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD54C423F3
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IBJLw3YA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s--xNAILQxG9; Thu, 17 Aug 2023 12:29:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0A86642272;
	Thu, 17 Aug 2023 12:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A86642272
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD71CC0039;
	Thu, 17 Aug 2023 12:29:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F6BBC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 12:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCC0542278
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 12:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC0542278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MSEyI7srfJG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 12:29:22 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E08042272
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 12:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E08042272
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-565e6502dbbso1783112a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 05:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1692275361; x=1692880161;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dod+jUAtrfq8WKcddvqjG23UkjL57VIedBdoOoctqWw=;
 b=IBJLw3YAf219tBI7sVt6VWmcoiIyEDDrLa0sjPY/WxLNHrENZ9phC3tjv4ABXq4NZf
 IFcSxd1r4zn5IQhQuT0pO297jksRHV3fLHHOmgZZzIM3WAJSgV35hk93EFJ5E1BSFn0d
 ztRjRbD9PFh4YBNXBcFbqYtAX4zsauVpADSBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692275361; x=1692880161;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dod+jUAtrfq8WKcddvqjG23UkjL57VIedBdoOoctqWw=;
 b=NdDkRzzabUIa53SvUGn5SIu7dCABGWmhYdeirsGP1eMGrIe1efSsOJE9OcEfOLi83I
 ICZBkyVqGaDNfCodmfMuTZFIcK5TctP0gozVFvKUQK7miU3eRGG2ONAAQ2YLVa0TZwGt
 yPTFggDB0MorK0URq6um0LjC4GtP/Su/gDDEnjHE5HPrf9JTfNaO5PSsjJge73hBLK2x
 AFOL9+9j+mUFn+Psq0fusaMlovjnYrQ859vaYlL/AdsqgsyVbi77zbqcTW9Y/bQEGGa9
 Hj7IGEEodiIJgOK81YvJMi0xc+tXYgwfN9+EbNWkKrriZXN5itx1OnHgOHeSjEsVxqRX
 EuiA==
X-Gm-Message-State: AOJu0YzBqHWCzydJxi4htb3HpuAhkHpSE+n7Qepex6vSO23VQ+eIwzPl
 L/4jBpTIQzLpHkDtdNQBBUQ9xbY9tpS51AnQ3tpKr5asvR6JP3Y9iKpX+u4C36eNfHZ4LKgdmPj
 k2LC0LI2uHi/+frKFyR1d64goaRMej+kjbPQwhHQizT24y6+QORRFsnc=
X-Google-Smtp-Source: AGHT+IHVPH3rk6MvI2h6lLylZm305Mf0+g8423xf4ra1Ui9xDTchMHOJ4lpvw0zZlpFILcnjry+hVOXzdir0Irh/sGU=
X-Received: by 2002:a17:90b:50b:b0:268:2127:6cb6 with SMTP id
 r11-20020a17090b050b00b0026821276cb6mr3849709pjz.16.1692275361559; Thu, 17
 Aug 2023 05:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230816085007.10591-1-coolrrsh@gmail.com>
 <38158855-5738-16a9-2237-34980917566b@infradead.org>
In-Reply-To: <38158855-5738-16a9-2237-34980917566b@infradead.org>
Date: Thu, 17 Aug 2023 17:59:09 +0530
Message-ID: <CAF7aS0pFAA=730Oy+-MH5Dgg-Yj7ye=2FFQmqRcczpbX1W7V6A@mail.gmail.com>
Subject: Re: [PATCH] scsi: sli4: Remove code duplication
To: Randy Dunlap <rdunlap@infradead.org>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
 james.smart@broadcom.com, linux-kernel@vger.kernel.org,
 target-devel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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
From: Ram Kishore Vegesna via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Ram Kishore Vegesna <ram.vegesna@broadcom.com>
Content-Type: multipart/mixed; boundary="===============1037106228291285002=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1037106228291285002==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000cf4a1106031d8f59"

--000000000000cf4a1106031d8f59
Content-Type: multipart/alternative; boundary="000000000000ca247a06031d8f00"

--000000000000ca247a06031d8f00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 1:05=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> Hi--
>
> On 8/16/23 01:50, coolrrsh@gmail.com wrote:
> > From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> >
> > In the function sli_xmit_bls_rsp64_wqe, the 'if' and 'else' conditions
> > evaluates the same expression and gives same output. So removing the
> redundant
> > code duplication to optimise the code.
> >
> > This fixes warning such as:
> > drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible conditio=
n
> with no effect (if =3D=3D else)
>
> What tool produces this message?
>
> > Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> > ---
> >  drivers/scsi/elx/libefc_sli/sli4.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/scsi/elx/libefc_sli/sli4.c
> b/drivers/scsi/elx/libefc_sli/sli4.c
> > index 8f96049f62dd..5e7fb110bc3f 100644
> > --- a/drivers/scsi/elx/libefc_sli/sli4.c
> > +++ b/drivers/scsi/elx/libefc_sli/sli4.c
> > @@ -2317,12 +2317,8 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void
> *buf,
> >               SLI4_GENERIC_CONTEXT_VPI << SLI4_BLS_RSP_WQE_CT_SHFT;
> >               bls->context_tag =3D cpu_to_le16(params->vpi);
> >
> > -             if (params->s_id !=3D U32_MAX)
> > -                     bls->local_n_port_id_dword |=3D
> > -                             cpu_to_le32(params->s_id & 0x00ffffff);
> > -             else
> > -                     bls->local_n_port_id_dword |=3D
> > -                             cpu_to_le32(params->s_id & 0x00ffffff);
> > +             bls->local_n_port_id_dword |=3D
> > +                     cpu_to_le32(params->s_id & 0x00ffffff);
>
> That could be correct. Or there could be a bug there.
> Who knows? I don't.
>
> But maybe it doesn't matter since AFAICT that field isn't used
> anywhere after it is set.
>
> >
> >               dw_ridflags =3D (dw_ridflags & ~SLI4_BLS_RSP_RID) |
> >                              (params->d_id & SLI4_BLS_RSP_RID);
>
> --
> ~Randy
>
The expectation here is that the s_id will be valid when the RPI
 is not registered.
This value will be used as the S_ID for the BLS reply sequence.

Change looks good.

Reviewed-by: Ram Vegesna<ram.vegesna@broadcom.com>

--=20
This electronic communication and the information and any files transmitted=
=20
with it, or attached to it, are confidential and are intended solely for=20
the use of the individual or entity to whom it is addressed and may contain=
=20
information that is confidential, legally privileged, protected by privacy=
=20
laws, or otherwise restricted from disclosure to anyone else. If you are=20
not the intended recipient or the person responsible for delivering the=20
e-mail to the intended recipient, you are hereby notified that any use,=20
copying, distributing, dissemination, forwarding, printing, or copying of=
=20
this e-mail is strictly prohibited. If you received this e-mail in error,=
=20
please return the e-mail to the sender, delete it from your computer, and=
=20
destroy any printed copy of it.

--000000000000ca247a06031d8f00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 17, 2023 at 1:05=E2=80=AF=
AM Randy Dunlap &lt;<a href=3D"mailto:rdunlap@infradead.org">rdunlap@infrad=
ead.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi--<br>
<br>
On 8/16/23 01:50, <a href=3D"mailto:coolrrsh@gmail.com" target=3D"_blank">c=
oolrrsh@gmail.com</a> wrote:<br>
&gt; From: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail.com" tar=
get=3D"_blank">coolrrsh@gmail.com</a>&gt;<br>
&gt; <br>
&gt; In the function sli_xmit_bls_rsp64_wqe, the &#39;if&#39; and &#39;else=
&#39; conditions <br>
&gt; evaluates the same expression and gives same output. So removing the r=
edundant <br>
&gt; code duplication to optimise the code.<br>
&gt; <br>
&gt; This fixes warning such as:<br>
&gt; drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible conditi=
on with no effect (if =3D=3D else)<br>
<br>
What tool produces this message?<br>
<br>
&gt; Signed-off-by: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail=
.com" target=3D"_blank">coolrrsh@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/scsi/elx/libefc_sli/sli4.c | 8 ++------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/scsi/elx/libefc_sli/sli4.c b/drivers/scsi/elx/lib=
efc_sli/sli4.c<br>
&gt; index 8f96049f62dd..5e7fb110bc3f 100644<br>
&gt; --- a/drivers/scsi/elx/libefc_sli/sli4.c<br>
&gt; +++ b/drivers/scsi/elx/libefc_sli/sli4.c<br>
&gt; @@ -2317,12 +2317,8 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void *=
buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SLI4_GENERIC_CON=
TEXT_VPI &lt;&lt; SLI4_BLS_RSP_WQE_CT_SHFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bls-&gt;context_=
tag =3D cpu_to_le16(params-&gt;vpi);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (params-&gt;s_id !=
=3D U32_MAX)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bls-&gt;local_n_port_id_dword |=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_to_le32(params-&gt;s_id &amp; 0x00ff=
ffff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bls-&gt;local_n_port_id_dword |=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_to_le32(params-&gt;s_id &amp; 0x00ff=
ffff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bls-&gt;local_n_port_=
id_dword |=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0cpu_to_le32(params-&gt;s_id &amp; 0x00ffffff);<br>
<br>
That could be correct. Or there could be a bug there.<br>
Who knows? I don&#39;t.<br>
<br>
But maybe it doesn&#39;t matter since AFAICT that field isn&#39;t used<br>
anywhere after it is set.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dw_ridflags =3D =
(dw_ridflags &amp; ~SLI4_BLS_RSP_RID) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (params-&gt;d_id &amp; SLI4_BLS_RSP_RID)=
;<br>
<br>
-- <br>
~Randy<br></blockquote>The expectation here is that the s_id will be valid =
when the RPI<br>=C2=A0is not registered.</div><div class=3D"gmail_quote">Th=
is value will be used as the S_ID for the BLS reply sequence.<br><br>Change=
 looks good.<br><br>Reviewed-by: Ram Vegesna&lt;<a href=3D"mailto:ram.veges=
na@broadcom.com">ram.vegesna@broadcom.com</a>&gt;<br><div>=C2=A0</div></div=
></div>

<br>
<span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">This ele=
ctronic communication and the information and any files transmitted with it=
, or attached to it, are confidential and are intended solely for the use o=
f the individual or entity to whom it is addressed and may contain informat=
ion that is confidential, legally privileged, protected by privacy laws, or=
 otherwise restricted from disclosure to anyone else. If you are not the in=
tended recipient or the person responsible for delivering the e-mail to the=
 intended recipient, you are hereby notified that any use, copying, distrib=
uting, dissemination, forwarding, printing, or copying of this e-mail is st=
rictly prohibited. If you received this e-mail in error, please return the =
e-mail to the sender, delete it from your computer, and destroy any printed=
 copy of it.</font></span>
--000000000000ca247a06031d8f00--

--000000000000cf4a1106031d8f59
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIQcgYJKoZIhvcNAQcCoIIQYzCCEF8CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg3JMIIFDTCCA/WgAwIBAgIQeEqpED+lv77edQixNJMdADANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA5MTYwMDAwMDBaFw0yODA5MTYwMDAwMDBaMFsxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdDQyBS
MyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
vbCmXCcsbZ/a0fRIQMBxp4gJnnyeneFYpEtNydrZZ+GeKSMdHiDgXD1UnRSIudKo+moQ6YlCOu4t
rVWO/EiXfYnK7zeop26ry1RpKtogB7/O115zultAz64ydQYLe+a1e/czkALg3sgTcOOcFZTXk38e
aqsXsipoX1vsNurqPtnC27TWsA7pk4uKXscFjkeUE8JZu9BDKaswZygxBOPBQBwrA5+20Wxlk6k1
e6EKaaNaNZUy30q3ArEf30ZDpXyfCtiXnupjSK8WU2cK4qsEtj09JS4+mhi0CTCrCnXAzum3tgcH
cHRg0prcSzzEUDQWoFxyuqwiwhHu3sPQNmFOMwIDAQABo4IB2jCCAdYwDgYDVR0PAQH/BAQDAgGG
MGAGA1UdJQRZMFcGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNxQCAgYKKwYBBAGCNwoDBAYJ
KwYBBAGCNxUGBgorBgEEAYI3CgMMBggrBgEFBQcDBwYIKwYBBQUHAxEwEgYDVR0TAQH/BAgwBgEB
/wIBADAdBgNVHQ4EFgQUljPR5lgXWzR1ioFWZNW+SN6hj88wHwYDVR0jBBgwFoAUj/BLf6guRSSu
TVD6Y5qL3uLdG7wwegYIKwYBBQUHAQEEbjBsMC0GCCsGAQUFBzABhiFodHRwOi8vb2NzcC5nbG9i
YWxzaWduLmNvbS9yb290cjMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjMuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yMy5jcmwwWgYDVR0gBFMwUTALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgEo
CjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAN
BgkqhkiG9w0BAQsFAAOCAQEAdAXk/XCnDeAOd9nNEUvWPxblOQ/5o/q6OIeTYvoEvUUi2qHUOtbf
jBGdTptFsXXe4RgjVF9b6DuizgYfy+cILmvi5hfk3Iq8MAZsgtW+A/otQsJvK2wRatLE61RbzkX8
9/OXEZ1zT7t/q2RiJqzpvV8NChxIj+P7WTtepPm9AIj0Keue+gS2qvzAZAY34ZZeRHgA7g5O4TPJ
/oTd+4rgiU++wLDlcZYd/slFkaT3xg4qWDepEMjT4T1qFOQIL+ijUArYS4owpPg9NISTKa1qqKWJ
jFoyms0d0GwOniIIbBvhI2MJ7BSY9MYtWVT5jJO3tsVHwj4cp92CSFuGwunFMzCCA18wggJHoAMC
AQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9v
dCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5
MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENB
IC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0E
XyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuul9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+J
J5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJpij2aTv2y8gokeWdimFXN6x0FNx04Druci8u
nPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTv
riBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGj
QjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5N
UPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEAS0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigH
M8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9ubG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmU
Y/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaMld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V
14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcy
a5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/fhO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/
XzCCBVEwggQ5oAMCAQICDBqPumG2a5F2dafbHDANBgkqhkiG9w0BAQsFADBbMQswCQYDVQQGEwJC
RTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMg
UGVyc29uYWxTaWduIDIgQ0EgMjAyMDAeFw0yMjA5MTAwOTAwMDNaFw0yNTA5MTAwOTAwMDNaMIGU
MQswCQYDVQQGEwJJTjESMBAGA1UECBMJS2FybmF0YWthMRIwEAYDVQQHEwlCYW5nYWxvcmUxFjAU
BgNVBAoTDUJyb2FkY29tIEluYy4xHDAaBgNVBAMTE1JhbSBLaXNob3JlIFZlZ2VzbmExJzAlBgkq
hkiG9w0BCQEWGHJhbS52ZWdlc25hQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEP
ADCCAQoCggEBAONjziUIESXBoQ0UDZweGt2PhNVLTW+kiEUzGn5HGCK7SIqowXvrv5cUgO0Rv9jL
6N+aG49Qd7D2t5cG/oV+k3hDAT1A4GM6vO33USYU1aGI9CIRqWWXUbPaz2scjTHiYCTN+7pPoYxS
+pLmf3klFroEHrJURJHTEqkL1JffpSOyJAm8O1YfibnESIw9d5+2E4T23EV/tW0PrxKObQDg44Kq
2zA9Cvc2rwq0eYy3MYtZhjNCQpspl2TQzcola/juDFoyAUF7D9OD7Pf0AH9yqa4tSkLGGWxzLPCL
6PIePC2XJcbFjRDx1wpfOdjQOdEsYF+yMgzXXSp8tqLdh5LM5ZcCAwEAAaOCAdkwggHVMA4GA1Ud
DwEB/wQEAwIFoDCBowYIKwYBBQUHAQEEgZYwgZMwTgYIKwYBBQUHMAKGQmh0dHA6Ly9zZWN1cmUu
Z2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNydDBBBggr
BgEFBQcwAYY1aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJj
YTIwMjAwTQYDVR0gBEYwRDBCBgorBgEEAaAyASgKMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8vd3d3
Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwSQYDVR0fBEIwQDA+oDygOoY4
aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcmww
IwYDVR0RBBwwGoEYcmFtLnZlZ2VzbmFAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwME
MB8GA1UdIwQYMBaAFJYz0eZYF1s0dYqBVmTVvkjeoY/PMB0GA1UdDgQWBBQaZQNNYUHOrXVDGMoR
3NybyZ4hAzANBgkqhkiG9w0BAQsFAAOCAQEARGZ6BqecpGQZa9HtRmQ0Tw8E3Wism01tm7fybzIV
JNxaSaFOp6bqOMPpRdO7XVAmvMHUX6NvgBS2xURWKhHi7yU7pXIOPnheGgUrVIYa8KRy/+5MWD54
0pKhwqS5gkHzwk47+u3HNIhr2wFbDbK0Vei2AUf1ICRwJQ1PDG9+LYRCIJZqv5EaDtJ1KhzU6H2+
wK4tdCNKvWy8nHgPw4+x25QIGk+ur66gc+8nY2Y3iejwIGjEjzoKlG6v8jm6Yt/1jnjJltAev6R6
bHCB3GzEib7aU2IBQ/Jv3bCf7h18Xl0j03xE6sJfZkU7u4DTF8njoco30Y4vvdQHAttklJkJLDGC
Am0wggJpAgEBMGswWzELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMTAv
BgNVBAMTKEdsb2JhbFNpZ24gR0NDIFIzIFBlcnNvbmFsU2lnbiAyIENBIDIwMjACDBqPumG2a5F2
dafbHDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgdECSFCgBVAsPTsbopcqhq6f7
mSUjFlEksxMbeSRmr8AwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
MjMwODE3MTIyOTIxWjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYw
CwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZI
AWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBALon+LWl5GMDhdUjzxWN7D02+SXelEyjSlyRhZ4dWPpX
aLqpO7BUWs+IvlhIIelACT6vXUbHIQ9JRwWn2r+YBDrsLD3zW0SIODE4fkInLF+rfmiM+L9Ff30/
6Bo4CreuT1BZqEEikIFYkqhsDYGuWqgwOSYD7YLyHLZhNAvBCcyqy1KRTD6JEguBDANP+6QpeEm7
GWUDPIGaFV8DLQmptWCSHjBpBBJtqne9iMO1SdIxMY9eqXofXPj+79ZymxaLiRCwle4lx3z2GmMB
LVKu0IOIN0oaqsDiA9ichpLu+9hSCuosJIKR5dk9JqWXGZ56haSi+qblwxBNjcgaYjL0IZg=
--000000000000cf4a1106031d8f59--

--===============1037106228291285002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1037106228291285002==--
