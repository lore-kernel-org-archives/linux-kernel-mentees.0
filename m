Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3479E1
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087014; cv=none; b=HgVWEc+x1ZiTFL0wvDZCT0FPB7wCpnauWDVQBOEILM0tzE/TLu2k1IkXlPL9R4TY82HYfxb2EwjqTK5bJUkPZpSXSIFnoOWxzOOZJTewf+M3aBRBwkHK7HOBSocca4cQ08LU14r77WkJkb3bqoGtLymoSwval41hgGerFP70AJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087014; c=relaxed/simple;
	bh=y+dNdt31+vy08/TWIUqkOmDZKgyr9J8hDr4RBIpTPYQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6WqCe2Sa+j/abHGtOZ3axN9gXUCPyW25zA5BwVNwQ0ctIBgAWCB24LmwESB8ZsZ2yr2EPaRKtMRLKQ2oiOL57XWCOtvrvbXtiJW6ZSXFBtgVViOi3Qv3bUAc9DB2Ofq27XaTNY51K3pRhILygklmWmxqloyR+Hf+N8z5UbQNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=EL+IVNhs; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="EL+IVNhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1743087010; x=1743346210;
	bh=PFXXGDMbpQFvQ/hQaIEg3jpMkWzB+T8hkAladjtD21o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EL+IVNhsayOu8kVwMlfVd3nq5EwD2JIjBGfsyqtK6puSJja3BJzR5S/vpm4y5e8Pk
	 nmPqI4Ww0vr/fwnedV8w/ki1WyWfR+4iIaLYjSUH77ZIwhAiDLpUWUiTKAvpOx+DU9
	 X9O76P3S5U+yFvj98pkIJJvx/cYPusv5PrIQz/XuoBm3IrMyEV4aiHZol+VSfw9kpy
	 2aHAp6eJCxZ3dr2Os2zxayffQbGdW2XNbezZdEEZ/xqP5vdBl0BDstMyk4Ny3KhdNk
	 W4dtRC6iM3xRHHoEKJF0onAwGaUmADcnvv9U+YmT7JOHTMHz9Outruw8S00LMFlse1
	 WiEUxaf5TnUTQ==
Date: Thu, 27 Mar 2025 14:50:05 +0000
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org
From: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
Cc: mmpgouride@gmail.com, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 1/2] bcachefs: replace strncpy() with memcpy_and_pad in journal_transaction_name
Message-ID: <20250327144956.1974622-2-nicolescu.roxana@protonmail.com>
In-Reply-To: <20250327144956.1974622-1-nicolescu.roxana@protonmail.com>
References: <20250327144956.1974622-1-nicolescu.roxana@protonmail.com>
Feedback-ID: 136600343:user:proton
X-Pm-Message-ID: f047c589a448da8fe068c37defd649133c6a5899
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Strncpy is now deprecated.
The buffer destination is not required to be NULL-terminated, but we also
want to zero out the rest of the buffer as it is already done in other
places.

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
---
 fs/bcachefs/btree_trans_commit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/btree_trans_commit.c b/fs/bcachefs/btree_trans_com=
mit.c
index c4f524b2ca9a..794b70cc98d7 100644
--- a/fs/bcachefs/btree_trans_commit.c
+++ b/fs/bcachefs/btree_trans_commit.c
@@ -364,7 +364,8 @@ static noinline void journal_transaction_name(struct bt=
ree_trans *trans)
 =09struct jset_entry_log *l =3D
 =09=09container_of(entry, struct jset_entry_log, entry);
=20
-=09strncpy(l->d, trans->fn, JSET_ENTRY_LOG_U64s * sizeof(u64));
+=09memcpy_and_pad(l->d, JSET_ENTRY_LOG_U64s * sizeof(u64),
+=09=09       trans->fn, strlen(trans->fn), 0);
 }
=20
 static inline int btree_key_can_insert(struct btree_trans *trans,
--=20
2.34.1


