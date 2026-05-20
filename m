Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77463D9DB1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 May 2026 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=140.211.166.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274328; cv=pass; b=RNAHbrsZCQaHvmuxjLdBJTOkTCtSwSheiqd1XJApO0Tqo/OBF6XjdB8rKTu0IiPlUuAEUMkSTdMIF9q4HNp0s3xft8f8+TODZl1dyrx5lmkUOajMsqbZEY/08Pqy03KE3Luyqb62+KxVyoCgYVYgPEahHpbP1UdadCZlZG3Y5is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274328; c=relaxed/simple;
	bh=C5kd5Kjq+KDN0eEW38EjUtDcIkeLXJ8Hpa6MCClTuvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwUIpxyALODMpYoU2lF0CVBDztmPPtEKfZgFI/p7kGeEEtLf3HCV1mtsga5W4PtBd7G1HaGN+NFo+QDZ9CY+N6celSs4q+AI/5jqV6eT+/GOIwbNvnDOSZnSo9p6lfXUOi1hp31OxGO/fFw+UvsrBR6b2X0S+fUa0KzJMQfMt4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9uXJlLH; arc=pass smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9uXJlLH"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DF36104D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 May 2026 10:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJ3tVp1lhvfX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2026 10:52:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=jens.wiklander@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E561F61043
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E561F61043
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M9uXJlLH
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E561F61043
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 May 2026 10:52:05 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-43496e6a964so3493313fac.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 May 2026 03:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779274324; cv=none;
        d=google.com; s=arc-20240605;
        b=PHudg+3gQ8xxZNohZUrgHKSX7C7M5NfjoXXcYVug/lTbJfA2KA8RNU6iTZA36M1dhM
         GTR2eHmPs5v5rv4AuTFaScwihyBXTNb9GI0E90cb5SnEBV3PhB+9/2VqkBrHPHF+rO0V
         1xFPJlZshlRG1pRyAChtFVmAuzxoePcmmXiU5SzTMwMnvD21cQ2uIpYFVCndczt4VxqI
         9f5p6bCwzUjYNaYsYIQphLI6eaoabBZrjUpcnbH1W16/nI58IIoenRWX47lONxZGMUGe
         Z27T03qoMRD4DYMUKfB91fKNhSuNtODYIL0VXDCkekwFO0zFmLI8NskCdqQz2Uw9fgbq
         3Ygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nPOHIcIs6lbXC2xlIAHEKgXOWfGw2NT1g/NXeTKaMwQ=;
        fh=ozevcqzT8IexES3ETBbRPLtSEA9Y9gAtS54t67s0E6c=;
        b=DeWP8Ztj7L3G9Cutr6MGV1/XwUCTIy/YWeH3nz7EzvMbPio/6eC3/vMV+dOJqnnmuK
         BBSBrfiqiaXR68QbptiGfFBKlJYXqqPdUy4qZoiuJ80BVEkAMLQWoReRc/emn3hdSlgE
         GKb+4DyIEXS3f9/6iEzNI0SUuTJU2OcOoD/CU8hQyqd+kbey91wFaxnNnZUBkTT0qNig
         LP5m2IYOe2N9T6lT80+ytNYxYmteTeyZx/Rbo5Es6LgKsKqaITIP9/1oVmPwVAWiWtGE
         647auSy7UfJr+EvMGqB/IDaHe8ZvYd/Dlyc9iKRH2ynToPRLuFtdg0fIGqTWwNDcd3X4
         35Qw==;
        darn=lists.linuxfoundation.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779274324; x=1779879124; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPOHIcIs6lbXC2xlIAHEKgXOWfGw2NT1g/NXeTKaMwQ=;
        b=M9uXJlLHQzqwaSQXQ5uBgJs1nz7OErnijzqutlM4+lJ8h4aCxA+Qdjjfi4JgfTBPSE
         jSCc+uvNcXZPnW0BdqPcWnpCe3ZOfBzPa4CJUu9bgXxzjlaDXkl6e1IizZsE2fy+a14u
         pzB4hfsbBU8drA3PcDtqZz8shYRy2q6jWX6/eBF4vRAA6mE/1zrI7SbQ9fT4zFPmH3/V
         sqVvPwQe+1BNhJyPtSLl19m9nws25GIelaS0vqS6F9CbnPh0FbJmO7gp+UQait+kBIJW
         7Ez+JhWOC23sEyE6cDSibvSeBb0OOOYuQJweihCMkwpEc4LBCmyNjTg4oJNZ+1T81LW0
         IOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274324; x=1779879124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nPOHIcIs6lbXC2xlIAHEKgXOWfGw2NT1g/NXeTKaMwQ=;
        b=LXfFfnFndZ6qer7yRFNU0v7uQ5fzBuYeZsDAqPDGpSVgnWvOWdak1UZgPiGzaP+hmg
         5lfMIsbiFMJpbBHwKTSfWVVfXbxvPvz7+VI9pquLGwQr2nPP0eGwciGw0kGy+sEg/bws
         FhS+uO9U8c/VLNDUeq44z1YV5OYFyoci2xbQHp2UVmcTO8ZgQ89hM+z4HtmqbZphG9qS
         3h8hRJoOabWqeQcxK0ojiRkE+HjiX7lx9H5Ng3jMzFZPciK9TY/fWIpAs6KC/N7TQAmU
         7YgGdC7E3GGgvfmUySNYxQFYLySQBmXaF2PZxOQ0oCzRxF/02mI5pZEjeme+cAfiO6QK
         u2GQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lpSO3Tejo4DoE/xtFPDQJyXRWdiXLidWY/xzUbW44bjguPHWcneDnUYZSghPfw4xXYIjZuGwE5SlZ3efbbwExzrhF5A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzkSDQnwtcrHN0ALS2DdwNgBfPdjwrGotK6NjGkA+bCX2C4ngxh
	HV/BAgSSAcw50xGepdqQwvB0S3v35K/2PMq/DSZYPn74ZKTKlj6qnlNse7IENap7cUbjCnLHndY
	KjlI8Uuhc/LxZ+8lh9HXoFVQohD5WIlikxBy/J4OKgw==
X-Gm-Gg: Acq92OGb9fbWfsnqwdbpJ0Wh55/7sUpi23wP6sUYAOY8iprmny5NJ0ZAst/RwLMHlsH
	uKiDgr9yrbLL4xh7++JSPQnRhC4hv21onDPvAvRWppJYWLs8BzgRDNXXYTeXC3xee7aREUN/gZj
	jtl+E00h88Yq3FTgZ1CNegrEwuAeGsawEjL9pdZOQk2kldLsllaEBrlrEyXN9XzXOnC5DdcCdjQ
	7zjLqlJZzELLVJj6shxBbKgQwnpKY/j71IMmnJc012q55x8BDs7edQVeV+2v+/n6tukSsCE+tFP
	JNr9qReRIbGZ1hSEQ1AUQKmMk5u7XtL2zTWX0A==
X-Received: by 2002:a05:6820:162b:b0:696:7780:477a with SMTP id
 006d021491bc7-69c955c8051mr14017800eaf.46.1779274324551; Wed, 20 May 2026
 03:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519020528.133623-1-robertusdchris@gmail.com>
In-Reply-To: <20260519020528.133623-1-robertusdchris@gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 20 May 2026 12:51:52 +0200
X-Gm-Features: AVHnY4K2o6NLWZCMDLJg6zJVV7wJlcp01Try26nd1v4PCGJvx45IMb0YFHlPtpE
Message-ID: <CAHUa44GqBpYNxV8AHrj_r7u3cbcTA0xTB7Q2Nk=vbpnxDLnrTQ@mail.gmail.com>
Subject: Re: [PATCH v2] tee: qcomtee: add missing va_end in early return qcomtee_object_user_init()
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: amirreza.zarrabi@oss.qualcomm.com, sumit.garg@kernel.org, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 19, 2026 at 4:05=E2=80=AFAM Robertus Diawan Chris
<robertusdchris@gmail.com> wrote:
>
> qcomtee_object_user_init() is a variadic function and when the function
> return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
> case, there's no va_end to cleanup "ap" object initialized by va_start
> and that can cause undefined behavior. So make sure to use va_end before
> returning the error code when there's no dispatch callback.
>
> This is reported by Coverity Scan as "Missing varargs init or cleanup".
>
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
> v1 -> v2:
> - Use "break" statement instead of "goto" statement. There's va_end
>   outside of switch-case, so we only need to go out from switch-case
>   instead of using a label (suggested by Amirreza Zarrabi).
> - Add "Reviewed-by" tag from Amirreza Zarrabi.
>
> v1:
> https://lore.kernel.org/all/20260513091031.145826-1-robertusdchris@gmail.=
com/
>
> I don't have the device, so I am not sure how to test this change.
> Thank you.
>
>  drivers/tee/qcomtee/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Looks good. I'm picking up this.

Cheers,
Jens


>
> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> index b1cb50e434f0..60fe3b5776e3 100644
> --- a/drivers/tee/qcomtee/core.c
> +++ b/drivers/tee/qcomtee/core.c
> @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *=
object,
>                 break;
>         case QCOMTEE_OBJECT_TYPE_CB:
>                 object->ops =3D ops;
> -               if (!object->ops->dispatch)
> -                       return -EINVAL;
> +               if (!object->ops->dispatch) {
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
>
>                 /* If failed, "no-name". */
>                 object->name =3D kvasprintf_const(GFP_KERNEL, fmt, ap);
>
> base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
> --
> 2.54.0
>
