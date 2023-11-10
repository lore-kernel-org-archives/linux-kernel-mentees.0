Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1215E83
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MD7c+kpV"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B1141EF7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 11:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B1141EF7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MD7c+kpV
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6apPcgCWaA07
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 10 Nov 2023 11:19:04 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4AD8241EF5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 11:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD8241EF5
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6bd73395bceso1585917b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699615143; x=1700219943; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whk9fs0zCzhy1i9O39uD7og53FJTww2F/GslFxYNQj8=;
        b=MD7c+kpV5rqKtDxsh07HtchVtd6yMmTnDrFSlFfkn/JKUzl+1l6qKeR0NtEVE9G79r
         kyF3eykxt6Ekw2SfeNnFOofDXc+EqGHqksMQbd79y7OVrGF1EBNA9+OW17plPYaXHGrr
         x5JpUnRaI7CmYVteBZPGBx58EyWiexFkT6O3ajeSzSBpO1MNua3Itz4XND3RCfewLGA2
         Vb/og521/0lFgSLtOJIvtrATqBUBMsFjgOdDfrIojM6GVFhtjWRgR1Dqve/XzU8JKNq2
         2kE41zJoEnfzEJQW6ADJK0N5ndEvYJUEr25pzhnjGXnsrGI51TgZfvBGnwae4TUSJky8
         Uflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699615143; x=1700219943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whk9fs0zCzhy1i9O39uD7og53FJTww2F/GslFxYNQj8=;
        b=O3TAJ3LR92OBCjGQplaZVDDlIoUU81u37eEiTyJIfBfyr0s1bVbF7Y/cST8yiGOjNs
         NCTT25yfWSJnQeY/2x5h3pQvCwa28syK8qwVqLIps7Ncww4gdZxQrYXrGu89fkR4DWQo
         TxB+l1ZcYdCxLcbL3nhqHsw7mCHExEzBYEyMbjbIUa5pD2M6i4pnTqDw7Zv01LcuQHaQ
         3wwtb/BhEvw4SNl1Uysr3K+emDWPlM7LkT9vNujKxuGActrj3+X20Nb+nKagWBiZdGyJ
         aUWPQzlw9nOlrs3CqQqg+2PBAMzYpgVhTWrSYIPMNPsyimB83cF94cyrl4018L0oF9Cz
         95dw==
X-Gm-Message-State: AOJu0Yyb5Ufsdb6+aRMGhxfXY6y1WLTmaYAiAWb/JehnowgK3enm9JL1
	DviRnyY9C1lYyT/MDsL+iTc=
X-Google-Smtp-Source: AGHT+IGw4vv33oM9rlOTVNJk3OnzI5FpCQaZiu4GqoW3Mqur9SQA9+xVcTPzCOz+GRTd4FlS7wIZVQ==
X-Received: by 2002:a05:6a00:6c87:b0:68f:cb69:8e66 with SMTP id jc7-20020a056a006c8700b0068fcb698e66mr4055742pfb.15.1699615143426;
        Fri, 10 Nov 2023 03:19:03 -0800 (PST)
Received: from ubuntu.. ([202.166.220.102])
        by smtp.gmail.com with ESMTPSA id b15-20020a056a0002cf00b00690c0cf97c9sm12444462pft.73.2023.11.10.03.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 03:19:03 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com
Subject: [PATCH v2] Fixes the null pointer deferences in nsim_bpf
Date: Fri, 10 Nov 2023 11:18:23 +0000
Message-Id: <20231110111823.2775-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110084425.2123-1-kdipendra88@gmail.com>
References: <20231110084425.2123-1-kdipendra88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller found a null pointer dereference in nsim_bpf
originating from the lack of a null check for state.

This patch fixes the issue by adding a check for state
in two functions nsim_prog_set_loaded() and nsim_setup_prog_hw_checks()

Reported-by: syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com./bug?extid=44c2416196b7c607f226
Fixes: 31d3ad832948 ("netdevsim: add bpf offload support")
Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/net/netdevsim/bpf.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
index f60eb97e3a62..5d755da3c736 100644
--- a/drivers/net/netdevsim/bpf.c
+++ b/drivers/net/netdevsim/bpf.c
@@ -97,7 +97,8 @@ static void nsim_prog_set_loaded(struct bpf_prog *prog, bool loaded)
 		return;
 
 	state = prog->aux->offload->dev_priv;
-	state->is_loaded = loaded;
+	if (state)
+		state->is_loaded = loaded;
 }
 
 static int
@@ -317,9 +318,11 @@ nsim_setup_prog_hw_checks(struct netdevsim *ns, struct netdev_bpf *bpf)
 	}
 
 	state = bpf->prog->aux->offload->dev_priv;
-	if (WARN_ON(strcmp(state->state, "xlated"))) {
-		NSIM_EA(bpf->extack, "offloading program in bad state");
-		return -EINVAL;
+	if (state) {
+		if (WARN_ON(strcmp(state->state, "xlated"))) {
+			NSIM_EA(bpf->extack, "offloading program in bad state");
+			return -EINVAL;
+		}
 	}
 	return 0;
 }
-- 
2.34.1

