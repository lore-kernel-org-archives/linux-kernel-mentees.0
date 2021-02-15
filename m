Return-Path: <SRS0=q8LZ=HR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4461C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 10:26:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E539664E00
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 10:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E539664E00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 81C5F85CBC;
	Mon, 15 Feb 2021 10:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OfJTj8xgnWO; Mon, 15 Feb 2021 10:26:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D3E785C95;
	Mon, 15 Feb 2021 10:26:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FBA1C0174;
	Mon, 15 Feb 2021 10:26:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B199C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 10:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E7CD38683B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 10:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjkVonuzL7fG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 10:25:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E2E0F8683A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 10:25:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id n8so8191224wrm.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z9SliCCRum/3A2E2ZMNlI9m+hPoUUx4IbBiUL26CGt4=;
 b=XmYapkqPECCZQ2urP7izpjxwLyQJGPa8zDUV3C5e8uDSsQB6IFaZE8Ld7RFtvmEdLC
 +IMr0tT7+eve+w26+I/NErozvBO8U3PwdPvpmvtwN+cTaHKUf/meRJCmnnTR9KPXD4Bc
 vvJQkfqcvu4L02plGHnXIrzbgRqs9zQ/UaUyZBlfFrDIKY9lwFOrQrzhFw3Xk+c8tEua
 LSRDeoTQPz4vQTjTydCHi3x7CuaISpuj+M9OsOOvz/MslR6G5deopedI4gqFxSvVP2+f
 /zzrE4G30+pdmtJlL1L3l+ebqai06+Y4Sjhu1YBwK3vfnVS16n0u4fGCE4RYX+KAjOEc
 jG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z9SliCCRum/3A2E2ZMNlI9m+hPoUUx4IbBiUL26CGt4=;
 b=B/TeJd1OPz6wkPpCcwtYOMcd3Xhgflbt2uY/Sz2a2vjQnJgLrxK0/unUzTjIde0oxR
 tShttLr1tlzc1TLPgzsB2OqcFRc8C3lsTdVR5SSivdoAB6a91I0n3p8wAKa5lzFsVLbi
 cVO2Nxny+C2yf4ihGbMNe54elyOWu+4VzWumV1t+ZQaR08zU7fbdnvmViA1bCdR2kbNM
 qJtlA30TrLvCtVT6gp4wblG/hXRQUNHeBuF9siRXgiQAFtSz5tIcVh2mkEJuiaTpeivQ
 hdF89tP3rxb42K5J7y7iNVa+uzuO5dfLXtHNnaVSH/g7Erq3OJVIrTLOp/DjQ46Eo9X3
 h25g==
X-Gm-Message-State: AOAM533LSqwHHfIoRuWlkZAnXoA7Nx6hOZS3K2pXr2SufrEzwL1O8j9O
 YzwijTTXBIiKyDhclCz+wPI=
X-Google-Smtp-Source: ABdhPJxjPOB8Gm2aMkGNZx+mNq7QWQir4NmLrHP2dOTubysE7eypcREIqAJZbaCXxS9zmJnTV7aZtw==
X-Received: by 2002:adf:f7c5:: with SMTP id a5mr18324488wrq.243.1613384757517; 
 Mon, 15 Feb 2021 02:25:57 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g136sm10467906wme.10.2021.02.15.02.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:25:56 -0800 (PST)
Date: Mon, 15 Feb 2021 11:25:55 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Fatih Yildirim <yildirim.fatih@gmail.com>
Message-ID: <YCpMM4HhAGkpHIX7@ulmo.localdomain>
References: <20210212073423.20562-1-yildirim.fatih@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210212073423.20562-1-yildirim.fatih@gmail.com>
User-Agent: Mutt/2.0.5 (da5e3282) (2021-01-21)
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, marvin24@gmx.de,
 linux-tegra@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 ac100@lists.launchpad.net
Subject: Re: [Linux-kernel-mentees] [PATCH -next] staging: nvec: minor
	coding style fix
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
Content-Type: multipart/mixed; boundary="===============0167738910538372723=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============0167738910538372723==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Umw6Y6994BHCIjmo"
Content-Disposition: inline


--Umw6Y6994BHCIjmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 10:34:23AM +0300, Fatih Yildirim wrote:
> Fix for the below coding style warning.
> Warning: Move const after static - use 'static const int'
>=20
> Signed-off-by: Fatih Yildirim <yildirim.fatih@gmail.com>
> ---
>  drivers/staging/nvec/nvec_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--Umw6Y6994BHCIjmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAqTDIACgkQ3SOs138+
s6GukQ//RtPgmq0gdQENuJQ8oYCYYuLbk/GyI6GciGBnKVAXRMaj1d0TmhVmEF0s
aB871tDOVfpuQwCl4wyCKSdcKR0ABq2mS0S04KHqP6vP7yQJTAjLLqzQLy7oLjAJ
R8un8u9upWqK8xGdL9nCiD5CRWCRX9TZ6CG6IV8Xw6mTefz3zrBwmwc3hmXJjLlQ
AyM8nGUU0FZVPa4Pvzu6d2oIPoZNdbIJSduz8Qo3yI7Cwhr3+9Qhrl0WgHSCWHKU
QOnr8SPmw+zEegpOJFCfpg7TlxR8EDvnrPLVCOQLMznkyIws8uVv/kLjoSmHDIEv
2WHthxJtyis/TxLlbbpE4tUHiJ5bg0JZdx50ssweJmtxBYp9FI97S3UTPXBViGZ1
PxrfIdFyW6zO5npGKP80Es0S/HnhznbVUljucwWk5vquDWQERDffkIDGD3ApBHxc
OVb6DaKHboha3YgQnqnFaJ+q1oHJ0Tu4k0unOjz8KKkTkSLNsfJfW/jxnsr491Fl
9VEqo7LpquJyqwcr0/Fto0YBPhC90uJKM2do1tuDb2m1k0QeFf4gg2dLwR9uYDGk
E8PfgH34Uyqomytd3cNuge60VO5U1Af3Drzm661cHkjtlX9HC1cnbavzrKiRbw8t
OtnuZv0dGkQQPWO/A154IUXZVAwZRFJTN4vvLThW8y6J6ia7f90=
=XqYj
-----END PGP SIGNATURE-----

--Umw6Y6994BHCIjmo--

--===============0167738910538372723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0167738910538372723==--
