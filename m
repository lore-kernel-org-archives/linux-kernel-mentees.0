Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF681E5B64
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759943788; cv=none; b=Doziaky2FkcrRHZPtQUkFmnzF3sIdocsAgTXHgwiYf280IM90Kz0XqbloufusRl6QYwURYLZeFDNmE+aAGxoedSQPMF6swW2XbxmpogrNpPerU91Swsxh48wizTSjeO9STri56E2Zn4XabNCDHbqmDeTSZmcx0/c9tIIxfZ1x7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759943788; c=relaxed/simple;
	bh=lSbsnp+f2ZfbNqP91vjR5Xj3Tii7DpPF2a5DI6ln/qI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AjbcQ9nKLLrTrooI2J5P0wFeZ4sBO2ELMEC4zJWOaEBDsJtzEd+Vb0yVIoFUGyOBFhVK1Up4X3KZcCtaH+rpMP4+/EKUqOf/cPM+Zz1UVIjGW5LULW+TGpAKnL2oWbC331bhD7/+WOtu/soPqcd1Nlb4lYCO4hc1KPrAhkskwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe00uoeM; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe00uoeM"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0BAE404E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 17:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFdWUeYJ84fL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Oct 2025 17:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=vnranganath.20@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C4A0404D3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C4A0404D3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Oe00uoeM
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2C4A0404D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 17:16:25 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-789b93e9971so7488b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Oct 2025 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759943785; x=1760548585; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cRuhYvqTv2rk1I3xV6eqvp2KxFVEUhGvlADpHk6TzHE=;
        b=Oe00uoeMSaJcyjCOHTGHuwAy8SBI2pDwv4E0X//P3snmD/ARKCgwlYrGXgveDxXJKF
         8DTPU7WFEXIBBJ2HgYO4NOn2rtoEd+g/N7cPMDML6XxYImeoN4dwmMOWehYn1HhsXNkp
         mvY6KI3cWtbNAUCJBW4TiRaCP5L93TfKaVedSTQ39eB01pZrzCGG/k6QB/OWoHcIHmgn
         TQlOMK+JbRAYYPkcVmR5CzbsidF9puKhT7Fhz3Jnx8IandayLlNbljcltc33hND+3IG1
         16oY6KhHSh0DErIDwpvtspRPHL81bS3JVGGnHecOgOs1ICQ7UKvd+/8fWm+9liKCJ0p8
         z6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759943785; x=1760548585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRuhYvqTv2rk1I3xV6eqvp2KxFVEUhGvlADpHk6TzHE=;
        b=Xe3j8xI9IrwuWwJ6QKWHzCRArZx7+wtyvvA97pN0bYy68de0sUnmNOL5NXk38Cxfnx
         RsEPkiqUlYdM6vPuCRBj5INO1+4ngtMJd+dA9Z/5uaJd3VnsQO+6NBb3wPuyJUDFKpGp
         72fNb/uajukseLMYd2+OvoroWZoFYaegt8Tz6JOy7wxAyN3UkLn/Db99tgq0HXRQACr4
         cy76NqW7y6VtW6o2zS2+s8kbC9HaNFmqBMMbfwwMr1tiGX/ANVAHwXx16GuUsPsBQNGd
         5XPFRaqVhcUzVW3chSetWRqC/J+6v6/ZJw0YUyEceYZsQeJJ4pOFQzr0LMqPuDzNYF6V
         smKw==
X-Forwarded-Encrypted: i=1; AJvYcCU/M0CyGBMsZvUwbAqHti4OR3OBFELL8MGR8OOeGdPp9oKrdDXII4ViBgWU26u9vgimxw9+UXAyOnH9W83A8uXkRG8MJw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyaXdwoIpwMPzikrzWouvhwdiUvXUMaRlYxwV8bMUJhtadWQGK/
	lOhmtf5KCZf1ee1SvLrT2Gqr4m/SOhlP6bQ+crk6Qh5LT6sf2XKBZOXU
X-Gm-Gg: ASbGncuDbUZDYmXL524aAs++I29+u0cddXUN3FLBgVxhLk8BR++ODMF0w5rt+K/8sOv
	O8SUPei6DQMAXG/vKpdasiFylUWx5qG4JLKlOadW5qTF4jAajro/WwgguNKxJGPdBFx7+M7kKHg
	pcpgcvRx9Pwy5L3KqN/VglMjxP6JKN8CqJq0OezTtipg2tqz42/FlT43mJwJbDoGrt7XMVzOlkl
	kh4kbT6WboUDDpk9dmKkn4jrDeJ1mbm5G3+3mx8l3MKvsSraRsEfsLIKhoeeG1qr55q44o2eq/h
	7tL159IHNHYCsAVownzKuvPUzMyDaprJC2Xuop0GNwQwYu6XqqMahJ/zlTkmJAzK29wjFfUd950
	nq5X5dFYmGe0QywxtfJYWwRxdlBB6T/kALHva0FBgSmn8VS1Lhca3CJ8=
X-Google-Smtp-Source: AGHT+IF2nVVJlk3OrgRyN8xpfnM0xEdDzSAX/mSWj64B8OkEIb0ZOfOvsN//kU9EW5Q2GLoooQcakA==
X-Received: by 2002:a05:6a00:3e21:b0:776:19f6:5d3d with SMTP id d2e1a72fcca58-79385513828mr2844390b3a.2.1759943785168;
        Wed, 08 Oct 2025 10:16:25 -0700 (PDT)
Received: from ranganath.. ([2406:7400:98:ffd0:1e7c:66e7:2459:3ac2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e2a4cb5asm261881b3a.71.2025.10.08.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 10:16:24 -0700 (PDT)
From: Ranganath V N <vnranganath.20@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca
Cc: linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Ranganath V N <vnranganath.20@gmail.com>
Subject: [PATCH] fs: ext4: fix uninitialized symbols
Date: Wed,  8 Oct 2025 22:46:13 +0530
Message-ID: <20251008171614.12129-1-vnranganath.20@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue detected by the smatch tool.

fs/ext4/inode.c:3583 ext4_map_blocks_atomic_write_slow() error: uninitialized symbol 'next_pblk'.
fs/ext4/namei.c:1776 ext4_lookup() error: uninitialized symbol 'de'.
fs/ext4/namei.c:1829 ext4_get_parent() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3162 ext4_rmdir() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3242 __ext4_unlink() error: uninitialized symbol 'de'.
fs/ext4/namei.c:3697 ext4_find_delete_entry() error: uninitialized symbol 'de'.

Tested with compilation only.
These changes enhance code clarity, address static analysis tool errors.

Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
---
 fs/ext4/inode.c |  2 +-
 fs/ext4/namei.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 5b7a15db4953..792b88522916 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3544,7 +3544,7 @@ static int ext4_map_blocks_atomic_write_slow(handle_t *handle,
 	ext4_lblk_t m_lblk = map->m_lblk;
 	unsigned int m_len = map->m_len;
 	unsigned int mapped_len = 0, m_flags = 0;
-	ext4_fsblk_t next_pblk;
+	ext4_fsblk_t next_pblk = NULL;
 	bool check_next_pblk = false;
 	int ret = 0;
 
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 2cd36f59c9e3..045616033515 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1762,7 +1762,7 @@ static struct buffer_head * ext4_dx_find_entry(struct inode *dir,
 static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsigned int flags)
 {
 	struct inode *inode;
-	struct ext4_dir_entry_2 *de;
+	struct ext4_dir_entry_2 *de = NULL;
 	struct buffer_head *bh;
 
 	if (dentry->d_name.len > EXT4_NAME_LEN)
@@ -1818,7 +1818,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 struct dentry *ext4_get_parent(struct dentry *child)
 {
 	__u32 ino;
-	struct ext4_dir_entry_2 * de;
+	struct ext4_dir_entry_2 * de = NULL;
 	struct buffer_head *bh;
 
 	bh = ext4_find_entry(d_inode(child), &dotdot_name, &de, NULL);
@@ -3133,7 +3133,7 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
 	int retval;
 	struct inode *inode;
 	struct buffer_head *bh;
-	struct ext4_dir_entry_2 *de;
+	struct ext4_dir_entry_2 *de = NULL;
 	handle_t *handle = NULL;
 
 	retval = ext4_emergency_state(dir->i_sb);
@@ -3224,7 +3224,7 @@ int __ext4_unlink(struct inode *dir, const struct qstr *d_name,
 {
 	int retval = -ENOENT;
 	struct buffer_head *bh;
-	struct ext4_dir_entry_2 *de;
+	struct ext4_dir_entry_2 *de = NULL;
 	handle_t *handle;
 	int skip_remove_dentry = 0;
 
@@ -3688,7 +3688,7 @@ static int ext4_find_delete_entry(handle_t *handle, struct inode *dir,
 {
 	int retval = -ENOENT;
 	struct buffer_head *bh;
-	struct ext4_dir_entry_2 *de;
+	struct ext4_dir_entry_2 *de = NULL;
 
 	bh = ext4_find_entry(dir, d_name, &de, NULL);
 	if (IS_ERR(bh))
-- 
2.43.0

