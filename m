Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D814EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 12:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A5AC614FF;
	Thu, 17 Aug 2023 12:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A5AC614FF
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Lp4RgGTr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nh_IxHHqT4mt; Thu, 17 Aug 2023 12:33:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id ACBF6614FE;
	Thu, 17 Aug 2023 12:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACBF6614FE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C059C0039;
	Thu, 17 Aug 2023 12:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5417FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 12:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F0714185F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 12:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F0714185F
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=Lp4RgGTr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FWlHAmmtIhp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 12:33:45 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F21B54185A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 12:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F21B54185A
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso5717098a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 05:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1692275624; x=1692880424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4QrDUH5IRxLwefO0PelicpgqeSGnfApEqaePajr9O8Q=;
 b=Lp4RgGTrNaywM0bumGG6qwXb5VCx7/Y/YRjneJULAvxxqjpERNjXit2Mfevn44yPZy
 MmUBJxaPCgB59kOb+Rvx+bpIM6A89M7+Tk5OgSaFo4NlbzMirhTOQ1wse7vQ86ukk/H1
 BbNjG6/dkNJIR8yOvdf6D3zFnIG2wS6YzlVTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692275624; x=1692880424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4QrDUH5IRxLwefO0PelicpgqeSGnfApEqaePajr9O8Q=;
 b=U+msWep4OnuiBH3xOhkoP5QPN5DxFH/I6fNfHoHtgWbjkNLrteoIGB8IFq6wVSPLmY
 nummopjyE5ZpzHDUNFSwIiBUAOUhmvIuu/a0gOa60pFvvkc3EWfZbNvr7qFs2xC5D/x/
 C8CAVxHWN8SU0OX2RqPYvWzJopUqJ/Rm6ppdFjDPyMhUBtHcuaU863tWlyiSJzve5EqO
 xC1buX4R1enRunwaHkHiKzm515Nv89INTfnmT6lwB4XYZlbSU3xW4q0ylkMQATxEiQIJ
 MftgePD/t5ckfzUTJZRHj7HBtRlf3Gc9INynJpOV5o0G1gqwjYKGGDdDd48VuDyc4L4d
 wfTQ==
X-Gm-Message-State: AOJu0Yyfi3KNG1XfOJ0+bDOUPe0qshCe2EHVDAvqHXNZzF3KucYN3tM8
 KtnR0rc8TU2cWvxea5EKAU0MAxaWBU1crouxPivKmeOEW8TgTiPThbDKeSXPwIU9lrYyA6JtkeE
 KvYbsvomoQG2yfF3yNPmZemU0oZ6Yl35inR2Tv+aSGxC0VND5/1/6dEY=
X-Google-Smtp-Source: AGHT+IESpGWDgmVDvDMeNdBX+5uC10z/MwU7F8MOaLhY+eyjnU6AyDym6b8uzVRzGF+jv/mPxC0aDYaaL5b97Xt97i8=
X-Received: by 2002:a17:90b:4b88:b0:26b:2c52:5fc with SMTP id
 lr8-20020a17090b4b8800b0026b2c5205fcmr4090142pjb.18.1692275624295; Thu, 17
 Aug 2023 05:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230817103751.16350-1-coolrrsh@gmail.com>
 <20230817105252.GA14370@yadro.com>
In-Reply-To: <20230817105252.GA14370@yadro.com>
Date: Thu, 17 Aug 2023 18:03:32 +0530
Message-ID: <CAF7aS0rrZvZK_bE21Umrr+RAGgQB6-qDdoqSPnKh6f7HcX8Ovw@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: sli4: Remove the buggy code
To: Dmitry Bogdanov <d.bogdanov@yadro.com>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
 rdunlap@infradead.org, james.smart@broadcom.com, linux-kernel@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============3806215128350558356=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3806215128350558356==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000786ac306031d9f6a"

--000000000000786ac306031d9f6a
Content-Type: multipart/alternative; boundary="00000000000073429606031d9f6c"

--00000000000073429606031d9f6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 4:22=E2=80=AFPM Dmitry Bogdanov <d.bogdanov@yadro.c=
om>
wrote:

> On Thu, Aug 17, 2023 at 04:07:51PM +0530, coolrrsh@gmail.com wrote:
> >
> > From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> >
> > In the function sli_xmit_bls_rsp64_wqe, the 'if' and 'else' conditions
> > evaluates the same expression and gives same output. Also the variable
> > bls->local_n_port_id_dword is not used anywhere. Therefore removing the
> > redundant code.
> >
> > This fixes coccinelle warning such as:
> > drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible
> > condition with no effect (if =3D=3D else)
> >
> > Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> > ---
> > v1->v2
> > Modified patch and verified with checkpatch.pl.
> >
> > ---
> >  drivers/scsi/elx/libefc_sli/sli4.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/scsi/elx/libefc_sli/sli4.c
> b/drivers/scsi/elx/libefc_sli/sli4.c
> > index 8f96049f62dd..af661b769464 100644
> > --- a/drivers/scsi/elx/libefc_sli/sli4.c
> > +++ b/drivers/scsi/elx/libefc_sli/sli4.c
> > @@ -2317,13 +2317,6 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void
> *buf,
> >                 SLI4_GENERIC_CONTEXT_VPI << SLI4_BLS_RSP_WQE_CT_SHFT;
> >                 bls->context_tag =3D cpu_to_le16(params->vpi);
> >
> > -               if (params->s_id !=3D U32_MAX)
> > -                       bls->local_n_port_id_dword |=3D
> > -                               cpu_to_le32(params->s_id & 0x00ffffff);
> > -               else
> > -                       bls->local_n_port_id_dword |=3D
> > -                               cpu_to_le32(params->s_id & 0x00ffffff);
> > -
>
> omg, it is not an unused variable. Whole bls is a HW descriptor, all of
> its variables are used by HW. You should keep v1 version of the patch.
> According to the comment at the beginning of the funciton s_id here shall
> be !=3D U32_MAX. That is an explanation for your v1 patch.
>
> >                 dw_ridflags =3D (dw_ridflags & ~SLI4_BLS_RSP_RID) |
> >                                (params->d_id & SLI4_BLS_RSP_RID);
> >
> > --
> > 2.25.1
> >

local_n_port_id_dword is not an unused variable. As Dimtry pointed out
all the above variables are used by the HW.

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

--00000000000073429606031d9f6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 17, 2023 at 4:22=E2=80=AF=
PM Dmitry Bogdanov &lt;<a href=3D"mailto:d.bogdanov@yadro.com">d.bogdanov@y=
adro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, Aug 17, 2023 at 04:07:51PM +0530, <a href=3D"mailto:coolrrs=
h@gmail.com" target=3D"_blank">coolrrsh@gmail.com</a> wrote:<br>
&gt; <br>
&gt; From: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail.com" tar=
get=3D"_blank">coolrrsh@gmail.com</a>&gt;<br>
&gt; <br>
&gt; In the function sli_xmit_bls_rsp64_wqe, the &#39;if&#39; and &#39;else=
&#39; conditions<br>
&gt; evaluates the same expression and gives same output. Also the variable=
<br>
&gt; bls-&gt;local_n_port_id_dword is not used anywhere. Therefore removing=
 the<br>
&gt; redundant code.<br>
&gt; <br>
&gt; This fixes coccinelle warning such as:<br>
&gt; drivers/scsi/elx/libefc_sli/sli4.c:2320:2-4: WARNING: possible<br>
&gt; condition with no effect (if =3D=3D else)<br>
&gt; <br>
&gt; Signed-off-by: Rajeshwar R Shinde &lt;<a href=3D"mailto:coolrrsh@gmail=
.com" target=3D"_blank">coolrrsh@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v1-&gt;v2<br>
&gt; Modified patch and verified with <a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer" target=3D"_blank">checkpatch.pl</a>.<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 drivers/scsi/elx/libefc_sli/sli4.c | 7 -------<br>
&gt;=C2=A0 1 file changed, 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/scsi/elx/libefc_sli/sli4.c b/drivers/scsi/elx/lib=
efc_sli/sli4.c<br>
&gt; index 8f96049f62dd..af661b769464 100644<br>
&gt; --- a/drivers/scsi/elx/libefc_sli/sli4.c<br>
&gt; +++ b/drivers/scsi/elx/libefc_sli/sli4.c<br>
&gt; @@ -2317,13 +2317,6 @@ sli_xmit_bls_rsp64_wqe(struct sli4 *sli, void *=
buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SLI4_GENE=
RIC_CONTEXT_VPI &lt;&lt; SLI4_BLS_RSP_WQE_CT_SHFT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bls-&gt;c=
ontext_tag =3D cpu_to_le16(params-&gt;vpi);<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (params-&gt=
;s_id !=3D U32_MAX)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0bls-&gt;local_n_port_id_dword |=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_to_le32(params-&gt;s_id &amp;=
 0x00ffffff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0bls-&gt;local_n_port_id_dword |=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_to_le32(params-&gt;s_id &amp;=
 0x00ffffff);<br>
&gt; -<br>
<br>
omg, it is not an unused variable. Whole bls is a HW descriptor, all of<br>
its variables are used by HW. You should keep v1 version of the patch.<br>
According to the comment at the beginning of the funciton s_id here shall<b=
r>
be !=3D U32_MAX. That is an explanation for your v1 patch.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dw_ridfla=
gs =3D (dw_ridflags &amp; ~SLI4_BLS_RSP_RID) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (params-&gt;d_id &amp; SLI4_BLS_R=
SP_RID);<br>
&gt; <br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;</blockquote><div>local_n_port_id_dword is not an unused variable. As D=
imtry=C2=A0pointed out=C2=A0<br></div><div>all the above variables are used=
 by the HW.</div></div></div>

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
--00000000000073429606031d9f6c--

--000000000000786ac306031d9f6a
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
dafbHDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgbDqL8Kc6jvjOXQcMT2s3X6ct
W8dz2X7gHYSSpePsal4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
MjMwODE3MTIzMzQ0WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYw
CwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZI
AWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBADGQFvodzrs8pqNzaliQK5Aio6vdARccy5sFGkVK4XRT
eo4ahCWq5RE5h0BLNuzgKYnCv6QixqOeuH/YNSje59KESBVQzSsVzpFINq6KgjJ+9H4gjlYamxe5
gxwfilhCV1zoWC48uFrh7ECb1fMAXtpApjJRAzuLPq72yve22FWo2nUommNArcEvbETroJ0TFmHS
OFgtdjKgha209SmuWoBsFeEsYTyUx+gGk0jwFIHzonwho+WV4Lwxi64T3CARhelFzvZhUwLVZQrE
Fn/cbajtaxUtLRtl+hR/vdrL62C+IaG3xSNu/7p83PUW8MqavdcQ1nFTEBbYfLExDXNixdQ=
--000000000000786ac306031d9f6a--

--===============3806215128350558356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3806215128350558356==--
