Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E9B1A3AA8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Oct 2024 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729610740; cv=none; b=urPjPYMV7WpVJ0PfpuoK/BcpW9GSSKwGY+3/6yQLtH1qFLypic8g0cX2O6m3uGWchXFaiSI8cqZaFhIUfCjmhuZXCbjni17PDLu8O3Zo9aCUc4T2T8PAitUQz4iFAb3Z4+yD26vpVfNmkKxTTylyZXqD7kt1+L98G/VTmZKZcmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729610740; c=relaxed/simple;
	bh=seJ9EZ22cEDevUVxu+OvqKQxCYUy8PExIx11DQC0kHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jen7rx/wmG7xoNriAIMnIaOO38djTR2yMQqZtUr/N4b3uankrnzjuz0CaUQfBtfLOc9LsR1Wy99SZTQWszadI7JUlHwsxesIFFd+bqSvAS/eVKSN/N3ecEe4mjC8dZacZY/2y/ybVApfWJAGwMypBL7Se3PqYOalNSfHTAoe13c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbANo26p; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbANo26p"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E943E6079C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Oct 2024 15:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xwodm7j-WLnm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Oct 2024 15:25:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+manas18244.iiitd.ac.in@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9618607A1
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9618607A1
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EbANo26p
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D9618607A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 22 Oct 2024 15:25:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22B0DA43D7B;
	Tue, 22 Oct 2024 15:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0F11C4CEC3;
	Tue, 22 Oct 2024 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729610735;
	bh=seJ9EZ22cEDevUVxu+OvqKQxCYUy8PExIx11DQC0kHs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EbANo26p9Mx/7/Rq1Vo2zvuXqowjBXHpSPqBVDN2EckVyWcti2CkAv2py1+AtLBms
	 U893DqbwT5pfZ/hiUojPl2NhdBrklS4pQQVUFb9gfd/V0ODpiQyDdIBYaJ1cHeF2y2
	 te1dsa/iqmJqtnl83emc8IvFW1ugYvNlN0mD9phS47VPA0DDXh2qpJwmrzE5XCkEXe
	 DNa9EzzWmutx6FdLJ8lE7HXtUa/ABY3q9Kc18N81wgnvf/xFtxuo62Q9izAwSmxGQc
	 Z84wWJy7ICT7eZBSOrZcLP/5vkpuo1ZJWSpNx/3BoHWJlXUbK9jbDeBQ2Rxt/+mI6B
	 iNu3wfGTMrLHA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DB9D2C56D;
	Tue, 22 Oct 2024 15:25:35 +0000 (UTC)
From: Manas via B4 Relay <devnull+manas18244.iiitd.ac.in@kernel.org>
Date: Tue, 22 Oct 2024 20:55:32 +0530
Subject: [PATCH] bcachefs: Add missing btree_bitmap_shift check in
 bch2_dev_btree_bitmap_marked_sectors
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-fix-missing-cond-bcachefs-v1-1-064a40e55610@iiitd.ac.in>
X-B4-Tracking: v=1; b=H4sIAOvDF2cC/x2MQQqAMAzAviI9W3BFYfoV8VBnpz04ZQURxL87P
 AaSPGCSVQyG6oEsl5oeqYCrKwgbp1VQl8JADbWuIcKoN+5qpmnFcKQF58Bhk2jI3vexc+KZCUp
 /Ziny/x6n9/0A2B8oKWsAAAA=
X-Change-ID: 20241022-fix-missing-cond-bcachefs-a889f51e8aa2
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Hongbo Li <lihongbo22@huawei.com>, linux-bcachefs@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Anup Sharma <anupnewsmail@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 syzbot+e8eff054face85d7ea41@syzkaller.appspotmail.com, 
 Manas <manas18244@iiitd.ac.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729610734; l=2170;
 i=manas18244@iiitd.ac.in; s=20240813; h=from:subject:message-id;
 bh=NGrI/M2/WyNTfN55jNdw37iuKR8z9suYfRj2qkDzA8E=;
 b=BGWbWB7uVb+YRHyrS+si0zmvjxu3ypdpqlixw+iXJ1cuktYtCNYYpc/DgJ0bIV40PN3NL1hv/
 s7C5v41YqdZBIBgcpie7iEA49J2qevrmUO/LypEiD4F+7tvvLVkOGJE
X-Developer-Key: i=manas18244@iiitd.ac.in; a=ed25519;
 pk=pXNEDKd3qTkQe9vsJtBGT9hrfOR7Dph1rfX5ig2AAoM=
X-Endpoint-Received: by B4 Relay for manas18244@iiitd.ac.in/20240813 with
 auth_id=196
X-Original-From: Manas <manas18244@iiitd.ac.in>
Reply-To: manas18244@iiitd.ac.in

From: Manas <manas18244@iiitd.ac.in>

The syzkaller bug triggers BUG_ON assertions in
__bch2_dev_btree_bitmap_mark. btree_bitmap_shift is checked in
bch2_dev_btree_bitmap_marked_sectors prior to this. But only one out of
two assertions is checked. This patch adds the other as conditional.

Reported-by: syzbot+e8eff054face85d7ea41@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e8eff054face85d7ea41
Signed-off-by: Manas <manas18244@iiitd.ac.in>
---
The syzkaller bug[1] triggers BUG_ON assertions in
__bch2_dev_btree_bitmap_mark.

btree_bitmap_shift is checked in bch2_dev_btree_bitmap_marked_sectors
prior to this. But only one out of two assertions is checked. This patch
adds the other as conditional.

A previous discussion about adding conditional in
bch2_dev_btree_bitmap_marked_sectors is here[2].

[1] https://syzkaller.appspot.com/bug?extid=e8eff054face85d7ea41
[2] https://lore.kernel.org/all/9ec25394-3d89-41b3-b62e-2d522cdc7319@huawei.com/
---
 fs/bcachefs/sb-members.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/bcachefs/sb-members.h b/fs/bcachefs/sb-members.h
index 762083b564ee5909071eb4235c3d5cd6e72ee519..3141791491928930a707a6a16579c6d2e11e3700 100644
--- a/fs/bcachefs/sb-members.h
+++ b/fs/bcachefs/sb-members.h
@@ -347,12 +347,16 @@ void bch2_dev_errors_reset(struct bch_dev *);
 static inline bool bch2_dev_btree_bitmap_marked_sectors(struct bch_dev *ca, u64 start, unsigned sectors)
 {
 	u64 end = start + sectors;
+	u8 bitmap_shift = ca->mi.btree_bitmap_shift;
 
-	if (end > 64ULL << ca->mi.btree_bitmap_shift)
+	if (bitmap_shift > 57)
+		return true;
+
+	if (end > 64ULL << bitmap_shift)
 		return false;
 
-	for (unsigned bit = start >> ca->mi.btree_bitmap_shift;
-	     (u64) bit << ca->mi.btree_bitmap_shift < end;
+	for (unsigned bit = start >> bitmap_shift;
+	     (u64) bit << bitmap_shift < end;
 	     bit++)
 		if (!(ca->mi.btree_allocated_bitmap & BIT_ULL(bit)))
 			return false;

---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241022-fix-missing-cond-bcachefs-a889f51e8aa2

Best regards,
-- 
Manas <manas18244@iiitd.ac.in>


