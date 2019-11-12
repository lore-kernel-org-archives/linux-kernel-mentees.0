Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED780C17440
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 20:02:12 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFAFA2196E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 20:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+UUHEHs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFAFA2196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E0DAEB0;
	Tue, 12 Nov 2019 20:02:12 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 951E2EA4
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 20:02:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4721C712
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 20:02:11 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id g18so6917526qvp.8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 12:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qzHKv7EJKhKKsRubq57MkGnr2W/gW3bcPkxKycveIzc=;
	b=B+UUHEHsiqJdprAmur9aX7FDIex3I/IotLgOO8Lb/dqHA20avIw5cQAbPbXyIx8CbJ
	87ynMj4c9wsq1G+QIgbx9qGTFY/iiZWfGOeOJS6g9nqaGVaxWGXqlJS6oq0BnHRiU3oD
	qEUbK4JvW4I17ErKuHqAIjxFxfKwXsIdBt3PffhzE3X8ONbJC1uv8tqWhBs1hGPGYjLk
	6HuM+3j1qbCmSMJ6egqrFtpHkTs9nupXdEuVXwsBxxIh9Np6XaMffdjLOOAPpiWvh0no
	IRIn4Lyk3l/vbNnOZKzyZUCJtFk1lWaNAABx+JbiUsUDOZzlUfK+99+tMJAVRXFL/UrZ
	mf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qzHKv7EJKhKKsRubq57MkGnr2W/gW3bcPkxKycveIzc=;
	b=jXWVxbBzrgDG014iOyVL3+ORv6pSzoY+TjOS3YU3E4vAO5ulWUF/89CDjx2lq2DalK
	HMhQokcFbcC1uDhuJEmJDivsf6v+eCs1qkow12Nr4AykC3tn56YxR8qcVDGtQ/NhL2Ai
	Qzu7lrh6uDUt4w/lhAAZ8tH46yzwT7yKhDcdWHdtg5+zZ0tMuMjXDm2CelpLW1liDmqH
	zCINztJ+blwgQDfdSDbJeWSwY60Q3wTVcFTPeX0qcMYfn3Pi0gB4lUGAR2swISyCMTkh
	+E66LCfGQWJkWX5rl5RMTDFjms2hQUHmfyVk6YsX856Fk63jdPgi13GaFNlxriuAERTe
	Y76Q==
X-Gm-Message-State: APjAAAWDMY3aDddEjqmTC/uR1qhTiHqq3PYekDuHhXXm7bTqVhd6x1aO
	zNyhvfdVtNheP49kn0Sqjd0=
X-Google-Smtp-Source: APXvYqw1d6VGo53vPkZIcxw/4poQLsxAcqWa51smX2+LKXfJow5F/ySOMVr+mfCIh7zD0m8plDAr8A==
X-Received: by 2002:a0c:fa50:: with SMTP id k16mr29483751qvo.172.1573588930212;
	Tue, 12 Nov 2019 12:02:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id
	w23sm13017071qtw.87.2019.11.12.12.02.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 12:02:09 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
	kstewart@linuxfoundation.org, tglx@linutronix.de, allison@lohutok.net
Date: Tue, 12 Nov 2019 16:54:45 -0300
Message-Id: <20191112195445.36761-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] media: au8522_decoder.c: fix
	checkpatch.pl error
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This patch fixes the following scripts/checkpatch.pl errors:

ERROR: space required before the open parenthesis '('
+	switch(input) {

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/au8522_decoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media/dvb-frontends/au8522_decoder.c
index c1717dde874b..8cdca051e51b 100644
--- a/drivers/media/dvb-frontends/au8522_decoder.c
+++ b/drivers/media/dvb-frontends/au8522_decoder.c
@@ -562,7 +562,7 @@ static int au8522_s_video_routing(struct v4l2_subdev *sd,
 {
 	struct au8522_state *state = to_state(sd);
 
-	switch(input) {
+	switch (input) {
 	case AU8522_COMPOSITE_CH1:
 	case AU8522_SVIDEO_CH13:
 	case AU8522_COMPOSITE_CH4_SIF:
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
