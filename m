Return-Path: <SRS0=vIBS=4A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCDCC3B186
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 07:25:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EAC72073C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 07:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYj9kQWz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EAC72073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 044108643F;
	Wed, 12 Feb 2020 07:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1ehIJCogG4E; Wed, 12 Feb 2020 07:25:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 834BF863A3;
	Wed, 12 Feb 2020 07:25:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70A3CC07FE;
	Wed, 12 Feb 2020 07:25:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE7DEC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AB22382397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDWIASq7TAGV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:25:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 49A7A81A1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:25:50 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j9so784714pfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 23:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :in-reply-to; bh=vsblHe4BrZXvpcTixylwUCR+Uct1lSaVWajbm+319XI=;
 b=HYj9kQWzQZ3fTJMk/bGjgfSATXE1MFXHn2Bh1bfBiqZL5oU1T/C6I4MSTVU5O4AX91
 BM/yA4DXtx9BpAXYND1akj0Z4GZ4pxCjV3+d0y+4jG7rgIhT4EQJCz7TgimW6coMuaW0
 nxKmXGPboS5FSnkZd878rI4rXkrUevqhM3XOsh2oFB+r+hHzwWbiuR9qEeWYJhznIqYp
 Gv17x96BCWlZVUWNYjXZsrE40l1Oug8Qc7+wI0MncYS/I+BxtZvxKNTrU5xbbgxqo55S
 knHy4QuAGo0sHzdH+zkLtT6p8CiEzXMNAUTwoE8I6oyIIzQV8GAHjgSbLFCImIaVYTMD
 iZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to;
 bh=vsblHe4BrZXvpcTixylwUCR+Uct1lSaVWajbm+319XI=;
 b=iEDs8UTSj/L9OvefGzgo9K4lv479MUfkbMdyn00vpJUa003ju4/HrNbTRcsyOgJsT0
 hGv8PA907i0A1WVdXcnm3zk9nkXJZtH5DCfEIjru0rR3d3NdU9ZbCp2ocVxSx8ak3LMp
 7cMfovrhFA6lmj0vb9NnIMv96SZDkZwQIOo15aG93ZwEdZR5Bbut2lu6CUhQiTtbcpfi
 pdMyquEi9ZzfktxqKTgA8oYf+4N40QXY8PqsauucAO3GqQW0zP1T3ygearpbtaC7LNEx
 jN7FRes7wWsodHEQI1+rf9rsbassI8C8oi4FDqvZGRBxLqsr8HDKvmMktpTjRVAsx+S5
 U0gw==
X-Gm-Message-State: APjAAAVFbUFovvM0yavdgPGQMlvYCKnnj6agimkpcw506ZXaWppTFQwF
 0goEzwYKAPBG+J1ubMpkmeQ=
X-Google-Smtp-Source: APXvYqxc/lSW35juqj9FltNn78TjgtbMbrka6XgwjPBR0EJH2QpY1Uqq7tJ3PWBdgH3NEhMLHLi9Jg==
X-Received: by 2002:aa7:8804:: with SMTP id c4mr7328335pfo.214.1581492349926; 
 Tue, 11 Feb 2020 23:25:49 -0800 (PST)
Received: from workstation-portable ([103.211.17.79])
 by smtp.gmail.com with ESMTPSA id e2sm5510979pjs.25.2020.02.11.23.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 23:25:49 -0800 (PST)
Date: Wed, 12 Feb 2020 12:55:43 +0530
From: Amol Grover <frextrite@gmail.com>
To: Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20200212072543.GI14453@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212072339.GH14453@workstation-portable>
X-Mailer: git-send-email 2.24.1
Cc: linux-scsi@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2 RESEND] scsi: qedf: qedf_main:
 Pass lockdep expression to RCU lists
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

lport->disc.rports is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of lport->disc.disc_mutex.

Hence, add corresponding lockdep expression to silence false-positive
lockdep warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/scsi/qedf/qedf_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
index 604856e72cfb..17eab7f8cf05 100644
--- a/drivers/scsi/qedf/qedf_main.c
+++ b/drivers/scsi/qedf/qedf_main.c
@@ -420,7 +420,8 @@ static void qedf_link_recovery(struct work_struct *work)
 	 * ADISC since the rport is in state ready.
 	 */
 	mutex_lock(&lport->disc.disc_mutex);
-	list_for_each_entry_rcu(rdata, &lport->disc.rports, peers) {
+	list_for_each_entry_rcu(rdata, &lport->disc.rports, peers,
+				lockdep_is_held(&lport->disc.disc_mutex)) {
 		if (kref_get_unless_zero(&rdata->kref)) {
 			fc_rport_login(rdata);
 			kref_put(&rdata->kref, fc_rport_destroy);
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
