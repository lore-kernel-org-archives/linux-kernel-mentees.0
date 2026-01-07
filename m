Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA003A7022
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  7 Jan 2026 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767807396; cv=none; b=fteLTBOQTDlSnj1Xawbwfp6ihS/WEDLWN4W5cNuAgFb3NAyeDo5ri4g1PlxfvKG/k5aW3l3ndaY1w00fmKgcywK9qu2n/lB7WusNgQT2s+YXLTjP4VDPzr885z/d/h+l/r4PEcLiRxv6kzIXX+Gcs8Ia8g7STI+CWQNx54HVT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767807396; c=relaxed/simple;
	bh=rJ2FEzykn2wRfHVwVoIYSVm1URZivbuB4kmgyV/Cf6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXcTRW9KxDLUPj9mV8b54xKWfdrja0WaD3+NJ8gZWh0k3yM9zhXI8OWU6dtCDoScjh8LhKcNmz+8sBjDHs5KOKVtL/vDa8ybHRkzfk0sp8XB3epXwCcm7EGm20admRrS3lOB4TWwKAAuMBk0xK8Gywyp9V33U/i5utxnJwNluiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=L3Tzwyj2; arc=none smtp.client-ip=209.85.210.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="L3Tzwyj2"
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-7c750b10e14so1010548a34.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 07 Jan 2026 09:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767807394; x=1768412194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6Kim2P3zRMaPFdNlnYDGfuWUUXkQRpNhwLY1h2KjS0=;
        b=RmDf94K58svwDsPy+w5eavxhtFihWdWNfuq7Y8lKnCLqjXu6XGk9gYLRwnIWP36Rnr
         bse9uTusCEYUTIMNdU/yEdWvpl79+jr/JEzr2iZ3FsVIdyziUJKqbLwvs9QQP9dltQ55
         BPMBSlcvVlw8aNPOnVgtLtkSoWppaI640wxbrfldKSwec+xvOXVeNlVX3FMKfKo0Qvh+
         sdGNb3KgdifflgA9RbBYlkDykOHqpKdPUwLZ74HuACwktZ5DQYU9ZFDt6YxYOx3hIu9t
         LxZqflI/5tSMAhTJ85lFTDC4VP1jNaHskF1eDaqk0wt8z9HqJAWUOe1YkLN3hTsYqVQC
         jgGA==
X-Forwarded-Encrypted: i=1; AJvYcCUEZ78GwCdWWStxmxWFutnjzuwdrAT1tlUWWZcBS6tEnWSHVH3BdFaoYPLz8YhO3s2MPtXrR6KEUQJTfk1P0OThYHEmfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhj/53xoh+5+WIbPgLFmJe1MwAjgs1BOnj07EkQLnS0K/FXEAh
	pHAobPAL+EH1N5Ebwjak7J+dH8AbuomE/f/cvLfUeUebJ752BXIYFwMUCtBBNDjlvdY/7O/G5ck
	rmjo6yC+ObcmIRjktTsDgmigqGcbcK5lU0jIYPH1w/IZhnMV+vquoou8jm5WvEY8u2qJuDRkvgL
	8xQvIN5lG/fQt7b3oJAnzg/DEjyvIT6LmumBNB6YdVjieqSPALGfgEF9GSWPubhE/Ns+5bO3cZs
	6BJzSWU8ITgCd4fQK7Ny/ClA2I=
X-Gm-Gg: AY/fxX5GtFeoxMJcTVJKaBF2tdzhOzCtQvdDjeY28H6ecQzg0urr9bzH6aC7hHjcsB0
	NHnd22zuyr9kmXxr3DiwyeeK6LYl/aW139G6aj+0bqqHGRjOgYSoI0eGkIbMQk4sh2gMnl8FTkO
	QqSb5SuwB75ALvcGE+a0D1o1vE59uu/EiGKTE6ceoqK/QCCASGFAEYNfayYFRtqYIWyDRKoTspu
	TuwKdXsBhNlhoxaa6o/KIq8BUHBCt5I4Uocc6NjFBz1ylRsutf/v3PIZ5E3eFg12Qlg1tutaCZk
	ZRG3dvhev1xA5pfXLwR1vT8wf++hyjXSPo1gwesrRYxNfLoNWAI2yraWjeoHlASSJyiiuedGL3V
	XOb7S29wgGiptOk8vnvh5BwCBDRuZW38oVqu64kLv4xSCQsgtWRCDgyM947I2QRzdLsQUMKLRDD
	Cy0ag3eMPEph3pwmZUt6VqyWgROSbCsMOHgZZefMA=
X-Google-Smtp-Source: AGHT+IFovXD1ly0XGcIZYOy7Fs7HEABdItJdW0gXe/8+dU+wy5AGthKP24XpMYRKK9eheUQfC5QEXtB/VMa6
X-Received: by 2002:a05:6830:4109:b0:7c7:d68:c7fc with SMTP id 46e09a7af769-7ce50bef212mr1471630a34.27.1767807393203;
        Wed, 07 Jan 2026 09:36:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-1.dlp.protect.broadcom.com. [144.49.247.1])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7ce47632961sm703698a34.0.2026.01.07.09.36.32
        for <linux-kernel-mentees@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jan 2026 09:36:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-383010aed8dso5163951fa.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 07 Jan 2026 09:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767807391; x=1768412191; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c6Kim2P3zRMaPFdNlnYDGfuWUUXkQRpNhwLY1h2KjS0=;
        b=L3Tzwyj26BHTFNXDkPB4CNGq/46RL87d6UVLaNPQNtspz0at41l7SlyuS3ufnWw6o+
         eKSuaacZA6SXvmnO9uQq32OW7mYf+AsyvwO5N70uYazDsoNzS+S2k+3YgdV0LNWa80Sx
         NAYsKiM9d2BKtUSmcQAMBplffRgmmUaKbLkWs=
X-Forwarded-Encrypted: i=1; AJvYcCVrmNJpHzHRAaLud3f3PhNP+hQs0vgE8eYnh1SV/BKQNpOff+RJnwfYQRN/PY+TcZN7wNlFqOT9p5Eu9AkLlhAy4RhoYQ==@lists.linux.dev
X-Received: by 2002:a2e:bd06:0:b0:37e:6e31:c9bb with SMTP id 38308e7fff4ca-382ff43d3e6mr9346871fa.21.1767807391205;
        Wed, 07 Jan 2026 09:36:31 -0800 (PST)
X-Received: by 2002:a2e:bd06:0:b0:37e:6e31:c9bb with SMTP id
 38308e7fff4ca-382ff43d3e6mr9346791fa.21.1767807390664; Wed, 07 Jan 2026
 09:36:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251211181044.4098689-1-kubik.bartlomiej@gmail.com>
In-Reply-To: <20251211181044.4098689-1-kubik.bartlomiej@gmail.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Wed, 7 Jan 2026 12:36:18 -0500
X-Gm-Features: AQt7F2pf4akrnFfZqDdcERJOiNJasdvhfrn4hJbfhlrQcyG6wB6oP5k4bb8rZts
Message-ID: <CABQX2QNP4L9vonRed1R-NLZvc0pD=5h9hU6OOhT-ay4HfMVJ=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix kernel-doc warnings for vmwgfx_fence
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, 
	david.hunter.linux@gmail.com, skhan@linuxfoundation.org, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, kernel test robot <lkp@intel.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009bd9b10647cfbb03"

--0000000000009bd9b10647cfbb03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 1:11=E2=80=AFPM Bartlomiej Kubik
<kubik.bartlomiej@gmail.com> wrote:
>
> Add missing descriptions for vmw_event_fence_action_seq_passed.
>
> This fixes the following warnings:
> drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'f'
>         not described in 'vmw_event_fence_action_seq_passed'
> drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:526 function parameter 'cb'
>         not described in 'vmw_event_fence_action_seq_passed'
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507040807.jKTxWGVQ-lkp@i=
ntel.com/
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_fence.c
> index 00be92da5509..85795082fef9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
> @@ -515,12 +515,12 @@ int vmw_fence_obj_unref_ioctl(struct drm_device *de=
v, void *data,
>  /**
>   * vmw_event_fence_action_seq_passed
>   *
> - * @action: The struct vmw_fence_action embedded in a struct
> - * vmw_event_fence_action.
> + * @f: The struct dma_fence which provides timestamp for the action even=
t
> + * @cb: The struct dma_fence_cb callback for the action event.
>   *
> - * This function is called when the seqno of the fence where @action is
> - * attached has passed. It queues the event on the submitter's event lis=
t.
> - * This function is always called from atomic context.
> + * This function is called when the seqno of the fence has passed
> + * and it is always called from atomic context.
> + * It queues the event on the submitter's event list.
>   */
>  static void vmw_event_fence_action_seq_passed(struct dma_fence *f,
>                                               struct dma_fence_cb *cb)
> --
> 2.39.5
>

Thanks, I pushed it to drm-misc-fixes, it will land during the next
drm-misc-fixes merge.

z

--0000000000009bd9b10647cfbb03
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIFF2
7MTefjBbZEDfC3DyNGKVxTu9uTn8smqlh5JqoFEdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDEwNzE3MzYzMVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAIpDiT5s0HYctDCuN+OfGYfTliAQcjXH3FnTqTMj
L8qtwx6+ARoZzfN2cmk0J71npi7nsoUb6rvqlKLQh+U3v3OlgVeciYsj06n2o63IOsyOXyZxIaWe
++o7aNuEjNMGiQ6ptvp1KRuKF56swzoZUZSVIRpUXD7F3OvEgzjA1Cg3bYYkQNxJ61GYSUN83Rrt
Sss1hfDztwl4PftaM1N7yYv0z4OEZEQWRJ4IHz2cqplTPJOUaIgte151MZHcUDkenqCqIjUD7p+3
UcILdNZUyK0QWYTY2av5Gsur6O7Dk5QThXxl/0EGOQF1yvP82jiUAW+7Bkqz9mdhXvNtlk8wYbk=
--0000000000009bd9b10647cfbb03--
