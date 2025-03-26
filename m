Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0888C1F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Mar 2025 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742983369; cv=none; b=MPra2w+iD23s7XVCnlfT5UhsqEp3MA4NO8CJHDLlucn5hemY2aXSlLeTStatzTz9+EQcEMu0gc0Li3X/vA5bD5+NDHdpipoZ7IYSdTXgpz3hV2VjH6nqxfwzTADFg25cZrcPmjxZCDOsq9p394XM7u1tUgcPfm0smxhbcxau2eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742983369; c=relaxed/simple;
	bh=ltuYgOBoRIHSm1h/laNdzdjkrsOJvZ1PJctSimi+EH4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Nkr4A43jzb0G0eiSZK+pUAlxhqRWC2YITTRBWZH7Rl0HLK84G2r+/qbdnJ0ZQG5xO1juJzJntF7C6ve5SfvryGB6AlnvOK6BPaQGEhgy/2DSG7TLdegNJoNuLjI4ryInvqRUggbcsRoRNyagpnL9RkavcZwDNNy7/s3sriuPGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9tRcbbG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9tRcbbG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22403cbb47fso130520305ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Mar 2025 03:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742983367; x=1743588167; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltuYgOBoRIHSm1h/laNdzdjkrsOJvZ1PJctSimi+EH4=;
        b=Z9tRcbbGVvMZwdNCJvaEjgB+LX9voL26H895AjDuhywXJAJstiPEBsgNKMliuSePID
         BW+ZjFvx1koc39pDpSye8KDzhAGp3gstUpD7EB/5zrKgMtPAoLmgXF5E1Swv2NIcK0jL
         H3wyl2uDQMYXwRQ9UzV+SwbCRMcnnfoMrD2mbJ1U+pUE+GvLLyDB+8OHm9bkQZSH/y9y
         2/4+IsSMPID3NHFrx+ltghoQ9YQizp5roi10JaeHC4Ny92n1j16qvlDZMJ4NsWXbtsyq
         gPx0rR5sKbKVMdBTKlw7THktwcqHADmIJNs/3B+nz50bSfWlsQJdvtzG9YRZeHTh27po
         n5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742983367; x=1743588167;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltuYgOBoRIHSm1h/laNdzdjkrsOJvZ1PJctSimi+EH4=;
        b=GWs9jyO3Wk6/4oZPnsE4fgaF5H5uTzuIJZOMxj2+tWwOBpeIwA+09RbNsz72mwkqX2
         6JMXwy6R2zJKzHjH8J8eROZuWo9klHuyFpg+5hiYC4uGkCX3T2kRNLJom4VG24NKOCQG
         JmEfNed9+hE1TZ8YnXtFx6Sq8dJzhN9MT7W7+K0dbims0woF/XUdbZmLqX/OGBixcN68
         rKH29BxGA4O98ZI2TdQorxczRRlAtdhblsqH6OIYWtJelcis8kUUPubYkCb34bi7ovB6
         Z+0/KLwdWEJqxiwCRqlhnKJrpWOWKhl8lhaFCqyrNMwPcrHmRP6aEbJ0ZB6jn5Puxukz
         29cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm6sDDFFCQ9GGGRHlEhh8ObSMvWxCRs8/edoOlxMIviSx6LIzfDKthiUsy0W4gVKQOcMFE596M2A1HZ4XS3JaGccv2Ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdT7iGvdcnLS83Q+oTPuRcvnjMo2Lk7b6PQijrqQgrGqVNu+9l
	Qrxd+NunMdEqMKiOBJuW6E/4VmCLyluzFQ94hsRDbgn4977EzGbfVnZ3LQ==
X-Gm-Gg: ASbGncuP8IqjSsUUBgK0B2uriKkY15cbEzP2A0BLa4DJr9F8sndIwddKsGS6RC2o2lt
	+nFKpIs4B3ot1yTglgh3/JndcujgWe8hbAjol4QVYMboUFx4POPO802Gj6g3FaalGdWFNK3XC1M
	R7JzaZc6DvJfhJY/cUn4v1zHAbcUbrEAsHpmhGA/bQNWm4F68lM9KNItLPNmj+tBHss43COaxz3
	fjE8Pe5E7jcLxwO8JZOCcG4IY8ETLyByYIF1egyRPsk9jd7ct7In2UAvbulR16eAyICPu3aGfct
	uiwibnQLbO60D3F3e/AK3A6/NKTQ
X-Google-Smtp-Source: AGHT+IFmRyDrWSokAiWcXtmt94I5j1NjixzYSrCGTSWharoB2uW3Raf6+3NbGkx8mxeuoWEV6s6VYg==
X-Received: by 2002:a17:902:f548:b0:224:a74:28cd with SMTP id d9443c01a7336-22780dacae2mr271815945ad.31.1742983367118;
        Wed, 26 Mar 2025 03:02:47 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227967dfe4dsm88116595ad.167.2025.03.26.03.02.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Mar 2025 03:02:46 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] bcachefs: replace deprecated strncpy() with strscpy()
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <20250326094449.16473-1-nicolescu.roxana@protonmail.com>
Date: Wed, 26 Mar 2025 18:02:31 +0800
Cc: kent.overstreet@linux.dev,
 linux-bcachefs@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F3AB2BC-43DA-47A6-A07A-72540B327D11@gmail.com>
References: <20250326094449.16473-1-nicolescu.roxana@protonmail.com>
To: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

On Mar 26, 2025, at 17:44, Roxana Nicolescu =
<nicolescu.roxana@protonmail.com> wrote:
>=20
> strncpy() is deprecated for NUL-terminated destination buffers. Use
> strscpy() instead.
>=20
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
> ---
> fs/bcachefs/btree_trans_commit.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/bcachefs/btree_trans_commit.c =
b/fs/bcachefs/btree_trans_commit.c
> index c4f524b2ca9a..7ab25b425d11 100644
> --- a/fs/bcachefs/btree_trans_commit.c
> +++ b/fs/bcachefs/btree_trans_commit.c
> @@ -364,7 +364,7 @@ static noinline void =
journal_transaction_name(struct btree_trans *trans)
> struct jset_entry_log *l =3D
> container_of(entry, struct jset_entry_log, entry);
>=20
> - strncpy(l->d, trans->fn, JSET_ENTRY_LOG_U64s * sizeof(u64));
> + strscpy(l->d, trans->fn, JSET_ENTRY_LOG_U64s * sizeof(u64));

The last time I asked Kent about this line, he didn=E2=80=99t want this.

> }
>=20
> static inline int btree_key_can_insert(struct btree_trans *trans,
> --=20
> 2.34.1
>=20
>=20
>=20

