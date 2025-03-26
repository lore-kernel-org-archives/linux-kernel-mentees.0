Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF971AF0B7
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Mar 2025 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982301; cv=none; b=ZCQpHJZka3aT6EUZgkDZ77LN3DoztaVHAqoJQs0y08WCCSKchOnNPSFIrRkriW1eTN0MDjjjTwPeFlKukD+wZ9xCaIm9E4rbSI/IYXWTZmR8Q9yVWcxLMUlHfSBWg46f8z/hD2CyCPftE3DTWRNnQXdBQvUG8x+Dup8tJBHsiiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982301; c=relaxed/simple;
	bh=6EI1fltzd44PGI06JvqwQ8j0ThmjGXP6mmlB1yJFgRI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ad6J4rEDaCJ5flU9AzX21HKaJ42ihgi2s+2xzaR/ldNgnWmzg69SfT9jczrFKeth3HM6qC8uvMSmFG/sDy9MAlRUrXfUaFL+R19SKXYuj/N0RX0RAW31ALk7RW4z98m9MEfFb4xoImvX3c8Ik/1BIuNUiTig1ffBgRxGLjh/lx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=CPjzO/l9; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="CPjzO/l9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1742982297; x=1743241497;
	bh=6EI1fltzd44PGI06JvqwQ8j0ThmjGXP6mmlB1yJFgRI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=CPjzO/l9amaezgJJ6ndci90m2+uAm9XmQths8RfRs7laPLhvqYP2OgpXle20bJbEh
	 LJlkqRw8/g8dgkoxVmhksd8Oa9wJ/nODL1EMKqJUTqeh0U273fakV2DwcToe2iO3w9
	 O39J9cuh7t/LwNxViw9TICgxTW3JFnpj0GDe9JZsMxWcgI1UhJ4YIyZQjIzO/A3ohR
	 m+sAwP0649DZPzYHt+iTHvo2j4CloPqIZKk90bziU8eDJJE/YXXTSmHpsZpq+pQj5W
	 iDTGoSKtfpV5C/ZweW377wEYD37uGf3eL09759PsvVtHtmwET+t2CaCu1mIfWkQCd8
	 3oNRUKXkhktNA==
Date: Wed, 26 Mar 2025 09:44:52 +0000
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org
From: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] bcachefs: replace deprecated strncpy() with strscpy()
Message-ID: <20250326094449.16473-1-nicolescu.roxana@protonmail.com>
Feedback-ID: 136600343:user:proton
X-Pm-Message-ID: 4c0c10d9ad8d922aaaa06340d7daca9e8fc3d332
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

strncpy() is deprecated for NUL-terminated destination buffers. Use
strscpy() instead.

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
---
 fs/bcachefs/btree_trans_commit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/btree_trans_commit.c b/fs/bcachefs/btree_trans_com=
mit.c
index c4f524b2ca9a..7ab25b425d11 100644
--- a/fs/bcachefs/btree_trans_commit.c
+++ b/fs/bcachefs/btree_trans_commit.c
@@ -364,7 +364,7 @@ static noinline void journal_transaction_name(struct bt=
ree_trans *trans)
 =09struct jset_entry_log *l =3D
 =09=09container_of(entry, struct jset_entry_log, entry);
=20
-=09strncpy(l->d, trans->fn, JSET_ENTRY_LOG_U64s * sizeof(u64));
+=09strscpy(l->d, trans->fn, JSET_ENTRY_LOG_U64s * sizeof(u64));
 }
=20
 static inline int btree_key_can_insert(struct btree_trans *trans,
--=20
2.34.1


