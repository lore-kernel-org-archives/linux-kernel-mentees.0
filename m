Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D270F264A8D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Nov 2025 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763323961; cv=none; b=JtMl5HY2mxDSKclztluiVfrGttmbfzq2IXBheh+MR35F9kWservLnBdMQAYvm0DdNeulE9rnPMCuZ79JnnuZGHHZMC7IPHmT+QaTd1EuLaML7L00vIkicwgkCZvmTgt3nMoUpyedDrDakrFDRSzc6F31aAinzO/WvDeq1jvXp8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763323961; c=relaxed/simple;
	bh=V2IStt8Ah0ibAXkEhs0DjeGkfAH1U4BKPM9dtFCn7Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3U+g1Uj5kfJ310Wv4xc+M63UDG0IhcYneyo7IiDzvrI1N8owdfyKZFKaIbobT3Zo4pUilOxc/CYsfW8uGS8GgbgMnDJ/rgMx4ywcOlCjKYPX6Ugtr/DYs575FSwK602Kaxpz7WDaWQGJ5TD4TARIGlNmnge+t8HceEfq9J76Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8qFQlo6; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8qFQlo6"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83388826A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Nov 2025 20:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbDCGQavCMQF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Nov 2025 20:12:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=agruenba@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82F1182628
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82F1182628
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P8qFQlo6
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 82F1182628
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 16 Nov 2025 20:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763323956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JdxinhLqQBZr88p5CsIf8R+KId3Y/CBCmsGoNiAy5+E=;
	b=P8qFQlo6GzClX/z3JdyPKVYCMqHKuKMXNRf8vByffG5Uppd0IeiD5r1jjjGG7DXiza5awG
	Q11M9wl8y1wEAmZ3cTy0doYCz24ij/unoCgMiEAz+9RTSNEWKMSedN/4nPOB0WoqqktICg
	K29bfvIT3DDC6FLhTgdfzs9AHllXJD4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-311-8eWQgqLwN7qg5wA7bgU2jg-1; Sun,
 16 Nov 2025 15:12:30 -0500
X-MC-Unique: 8eWQgqLwN7qg5wA7bgU2jg-1
X-Mimecast-MFC-AGG-ID: 8eWQgqLwN7qg5wA7bgU2jg_1763323949
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0F263195608A;
	Sun, 16 Nov 2025 20:12:29 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.44.32.90])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C54AA180049F;
	Sun, 16 Nov 2025 20:12:25 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>,
	gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+19e0be39cc25dfcb0858@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] gfs2: flush withdraw work before freeing gfs2_sbd
Date: Sun, 16 Nov 2025 20:12:23 +0000
Message-ID: <20251116201224.2151726-1-agruenba@redhat.com>
In-Reply-To: <8f270474-7ced-4668-97da-f3d7709a82e7@gmail.com>
References: <68f6a48f.050a0220.91a22.0451.GAE@google.com> <20251024144332.33773-2-nirbhay.lkd@gmail.com> <8f270474-7ced-4668-97da-f3d7709a82e7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi Nirbhay,

On Thu, Nov 13, 2025 at 9:24 PM Nirbhay Sharma <nirbhay.lkd@gmail.com> wrote:
> Hi Andreas,
>
> I hope this email finds you well.
>
> I'm writing to follow up on the GFS2 patch I submitted regarding the ODEBUG warning in free_sbd(). The patch addressed the syzbot report where sd_withdraw_work was being freed while still active.
>
> I wanted to check if you've had a chance to review the patch, or if there's any feedback or additional information I can provide to help with the review process.
>
> I understand maintainers are busy, and I'm happy to make any necessary revisions or provide further clarification on the testing that was performed.

thanks for looking into this issue, but this is already fixed in the
updated version of patch "gfs2: Asynchronous withdraw" which has been on
gfs2 for-next since at least October 23.  Below is my isolated fix.

Thanks,
Andreas

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 2d177aa21ffd..c42982bdd4b2 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1294,7 +1294,6 @@ static int gfs2_fill_super(struct super_block *sb, struct fs_context *fc)
 fail_per_node:
 	init_per_node(sdp, UNDO);
 fail_inodes:
-	flush_work(&sdp->sd_withdraw_work);
 	init_inodes(sdp, UNDO);
 fail_sb:
 	if (sdp->sd_root_dir)
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index fff0b0e2e27c..c454bea101de 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -345,6 +345,12 @@ void gfs2_withdraw(struct gfs2_sbd *sdp)
 		} while (unlikely(!try_cmpxchg(&sdp->sd_flags, &old, new)));
 
 		dump_stack();
+		/*
+		 * There is no need to withdraw when the superblock hasn't been
+		 * fully initialized, yet.
+		 */
+		if (!(sdp->sd_vfs->s_flags & SB_BORN))
+			return;
 		fs_err(sdp, "about to withdraw this file system\n");
 		schedule_work(&sdp->sd_withdraw_work);
 	}

