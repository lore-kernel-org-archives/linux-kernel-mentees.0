Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CA725A323
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 21:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253524; cv=none; b=dk0P5YUkZA4JxSXRGvu0sIpwFN8Bnqcs11R1bodQqTQ73e2f4kLTCcxNLS6GrxlBpY8c2AwqAdlIMTY6k6dXwBfS2wwQHrjJTtw19cdDF1AZ9E5IrLCWeeZLf9cEQ8tJxsMP2vr1fgT5hvcTzDB92aPF5ak897s2+P0JrVYwah4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253524; c=relaxed/simple;
	bh=uNN9PPr/yTFHzxK8MQ3XHv/YvwCSmF0U+8ouACnxjAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hke3JiA/pqwZfYmP1NeRIT+7eGC8EbTO1JIfQfcJ1r0bXviPnMO3qr0guzysSAT08qOkgIcVT70lry6pc76qBHIgMUPAG8xvXBe84uzgDRIavdchgeRASxpAVopuOoHjJI/b9jOIphSRzYjufK9qp4p8pWtBQM76XbrzV7bYYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ugbp1H0v; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ugbp1H0v"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-378d50e1cccso15468791fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 14:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253520; x=1761858320; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=862okFpfVZvhmXzSNmyjfrfI1Xm8aQ7K46jS7eTHfAM=;
        b=Ugbp1H0vZgKPZvfzoGPsVhU5O2xH97v1OquWuX/B+tOUQEltQhwds1tsiVHOgUTa6Z
         glBFQAb5hk7RzHBM7ICOTOYFVc9Ir2wDc1S3NrUNLttNd+yTj4bcQ0YerEThKBpsUR0a
         gHqMJurmwNLmE5u3MI6xVznxCgkc0KBrpveYCoOYwaeraTXQDhUeWD2bLA7e89Utyazq
         sJZ5eDz1THk5lcq+AArgczpah7jq/KCJO3xLvUar1cKnlv7u6hpA7asVOOQYUX0a9G4y
         uHJIhqkpJYB9nmu1alfXyz/4KjU55D6+iKIxusQ+kXcz3EaaJZkD2fif/46hQ3GTJEkk
         Kynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253520; x=1761858320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=862okFpfVZvhmXzSNmyjfrfI1Xm8aQ7K46jS7eTHfAM=;
        b=Jqxnst1UysoReVHafeACBDI5xTdvpApiFHLT/N62f+k/dv/SU6gJHpyga+ACRlq61z
         OJt9GJrAZui5NirCUxxfZGjvFTu80GXT0HtgCaMJGV95b1Q6zr5b1l5Q/wdQSmosNc8x
         MC6Ov1ujjfa5HDG51vcj/QXRiR3nGOFNI4ICe+QoYk+IOQfFrX/aLqcT2Zsq0EWTByjj
         4HLbYvvt6g4zX3yVWmeoMgsg7S6h/btvKibYVofr4+p3DNUmVoRba66Yfu4hLzqde3dv
         rjJnpqDZ0oVOEtB8OZI4OknSH7AWtEzDuoQQmimCbbtqO47bDxTmWSL7oNeBxxyd2ic2
         rFEw==
X-Forwarded-Encrypted: i=1; AJvYcCXjR/pVYAvPqLy8s1xsDHtl0u22BShmRqFUKs+F+foGKB+iAf1LlkhX++7v3jocP+6C3bDjuAluglF4FaUiuEyUwvnilQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Rubf9rvVsI3a9kLeFlXmMcKuKpcZk7IYsi5kdyJnfNzE3TRx
	qMz/hJXeW9RFiHto5f1a6ot22M+LE5ItXTVcP/UpNIZEa9qeZmLLcbdaYJ7MeQCjJievHmrJo8j
	iNJGJmu+WFIY8dHWLVMIpPtbWMygTn68=
X-Gm-Gg: ASbGncvQRJrk8+miTF957XTZsB1muSbD+C6l6WTrLKxvq3z1CfBWl6P/6JaGbH4SUy7
	Sghp23rV7nj4Fcc55JWbChhHVoBX7TkdqOL/2w7A/CMGx42uI83rF46t651nWaT5tgZcx9Hmk9O
	VCDzuzTgS9JTO6nPA2mbvuem1DqMqzdmIZxBJgAqUr+1xJf8qiiQ8FFlQhsZPWA1z36OX1msVm8
	aG+iWHHOERMNTpRkaPMsrKi2iGFhjs4sxSCaksjiHHX1NxBVJAsawI6LTkbZ/HMtn+gOw==
X-Google-Smtp-Source: AGHT+IG9hVStadcHgcH9pwqipVZ8q236Yr5ZSYyiWguCrs1hAdh+Ks2DDRtnidEtfFSfFhuAguYEPWv9H0ksKC0iQco=
X-Received: by 2002:a05:651c:908:b0:376:2802:84b0 with SMTP id
 38308e7fff4ca-37797a8ed3fmr71073181fa.46.1761253519780; Thu, 23 Oct 2025
 14:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022223417.139332-2-rpthibeault@gmail.com>
In-Reply-To: <20251022223417.139332-2-rpthibeault@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 23 Oct 2025 17:05:06 -0400
X-Gm-Features: AWmQ_blXZO5mFjarWLO1_mPPNpv69dkFfEOsfq92hPD4abmuqgith-oR4ByY-LI
Message-ID: <CABBYNZJtp0wqL_SJEk0wVo4DuadrBirmJ5VOe_TyE_RN8jOJNA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_event: validate HCI event packet Parameter
 Total Length
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+a9a4bedfca6aa9d7fa24@syzkaller.appspotmail.com, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Raphael,

On Wed, Oct 22, 2025 at 6:38=E2=80=AFPM Raphael Pinsonneault-Thibeault
<rpthibeault@gmail.com> wrote:
>
> There is a BUG: KMSAN: uninit-value in hci_cmd_complete_evt() due to a
> malformed HCI event packet received from userspace.
>
> The existing code in hci_event_packet() checks that the buffer is large
> enough to contain the event header, and checks that the hdr's Event Code
> is valid, but does not check the hdr's Parameter Total Length. So,
> syzbot=E2=80=99s event packet passes through and uses the un-init values =
in
> hci_event_func() =3D> hci_cmd_complete_evt().

It does checks the length:

    if (skb->len < ev->min_len) {
        bt_dev_err(hdev, "unexpected event 0x%2.2x length: %u < %u",
               event, skb->len, ev->min_len);
        return;
    }

> Reported-by: syzbot+a9a4bedfca6aa9d7fa24@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Da9a4bedfca6aa9d7fa24
> Tested-by: syzbot+a9a4bedfca6aa9d7fa24@syzkaller.appspotmail.com
> Fixes: a9de9248064bf ("[Bluetooth] Switch from OGF+OCF to using only opco=
des")
> Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
> ---
>  net/bluetooth/hci_event.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index d790b0d4eb9a..5e1498cc04cd 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -7565,7 +7565,7 @@ void hci_event_packet(struct hci_dev *hdev, struct =
sk_buff *skb)
>         hci_req_complete_t req_complete =3D NULL;
>         hci_req_complete_skb_t req_complete_skb =3D NULL;
>         struct sk_buff *orig_skb =3D NULL;
> -       u8 status =3D 0, event, req_evt =3D 0;
> +       u8 status =3D 0, event, req_evt =3D 0, len;
>         u16 opcode =3D HCI_OP_NOP;
>
>         if (skb->len < sizeof(*hdr)) {
> @@ -7585,6 +7585,13 @@ void hci_event_packet(struct hci_dev *hdev, struct=
 sk_buff *skb)
>                 goto done;
>         }
>
> +       len =3D hdr->plen;
> +       if (len !=3D skb->len - HCI_EVENT_HDR_SIZE) {
> +               bt_dev_warn(hdev, "Unexpected HCI Parameter Length 0x%2.2=
x",
> +                           len);
> +               goto done;
> +       }

Looks like a big hammer for a uninitialized value, which I assume is
from the following code:

    if (i =3D=3D ARRAY_SIZE(hci_cc_table)) {
        /* Unknown opcode, assume byte 0 contains the status, so
         * that e.g. __hci_cmd_sync() properly returns errors
         * for vendor specific commands send by HCI drivers.
         * If a vendor doesn't actually follow this convention we may
         * need to introduce a vendor CC table in order to properly set
         * the status.
         */
        *status =3D skb->data[0];
    }

That one is accessing skb->data without first checking it like
hci_cc_skb_pull like all other event handlers are doing, if that is
really the case then something like the following should make it go
away:

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index bae8c219341a..e71fbdebffae 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4219,6 +4219,13 @@ static void hci_cmd_complete_evt(struct hci_dev
*hdev, void *data,
        }

        if (i =3D=3D ARRAY_SIZE(hci_cc_table)) {
+               if (!skb->len) {
+                       bt_dev_err(hdev, "unexpected cc 0x%4.4x with no sta=
tus",
+                                  *opcode);
+                       *status =3D HCI_ERROR_UNSPECIFIED;
+                       return;
+               }
+
                /* Unknown opcode, assume byte 0 contains the status, so
                 * that e.g. __hci_cmd_sync() properly returns errors
                 * for vendor specific commands send by HCI drivers.

> +
>         /* Only match event if command OGF is not for LE */
>         if (hdev->req_skb &&
>             hci_opcode_ogf(hci_skb_opcode(hdev->req_skb)) !=3D 0x08 &&
> --
> 2.43.0
>


--=20
Luiz Augusto von Dentz
