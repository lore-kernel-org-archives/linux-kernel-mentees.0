Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87DFCA44
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT329DQr"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BDB740947
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 08:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BDB740947
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JT329DQr
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YR-up1KWixro
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 10 Nov 2023 08:45:40 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5C5D940902
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 08:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C5D940902
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c9b7c234a7so16146045ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 10 Nov 2023 00:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699605940; x=1700210740; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tQwwNNq0rca7smlg942N55FBCyeR6HoarsSMcpeyXfo=;
        b=JT329DQrudNxEsQvt35LH3sEruGoTbzKcAJsWkaN2HULm3XLKx6rs2hztzFn0DGArM
         hNWIK19ZpXBJtHRX+4lU6aqb1bzn/jGqreZcgy0GEE+6Sqzp3G0TCfNuC4JDhc5rh3ye
         wo1g6JUMlsAxAGwbCxo7F3Ji+RHo4G0btWB/oCB29Dp/RREoiMcz53TX5OycMeRN94sf
         3eVosK8pKatdn/UELpBmICZnGdkanOsOBHZQvDC8LsmfYqWzH0oDTMQb/0Jhkhi88Hhn
         mP3FzKBEG4UAnpt6DPID4RH9SbZ4fXTLZ8J/4bJqC4lqZsWgRuH+S+mgnA4rMLIzpw3C
         5LmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699605940; x=1700210740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQwwNNq0rca7smlg942N55FBCyeR6HoarsSMcpeyXfo=;
        b=KmW3q9p8Tf3WCPvUNMdF0L8UJhzgGSKsSWrDZsa1MEoO+TkIGFLTwDa5DY1xarxUhu
         uS1nGnKINzkjRFMH9sqcoJ6NynrS8XN7K/4WEqF3gJhExB/gjNAkW9os7cVJGBGwJO4T
         WuKO9lfvHnIcihDRw5DcwdlrX4ppYU0vwK1jgc7hJcIMTSaML7silK1Da47BKLL0XonY
         BWNpOAT2grTCvRArJuAofyscAmNVw0m/tPKZCsT1WBcaSuSDQ4rmPePw7sB8m+A+DjRY
         gdRyn0gQd5vdtPbVWfSgpY+DjDj7BXtznvhfXLzAQO6wXcx66kjRsZCf1h7YjzSAOGEO
         jHnw==
X-Gm-Message-State: AOJu0YxJWn+6qFA0Gt5/kRudMs7lHPPgukjzeZt0Uu4VjZj29bFYWpah
	8im4rUcZL/RKMK8NxeHn4vo=
X-Google-Smtp-Source: AGHT+IEGsLh5TZE/KmGOm61zWeBJcHj83BW7ZKiroop3egiA5LcitDOFLwDoJxqbVdZ2nNAnhTue6g==
X-Received: by 2002:a17:902:6803:b0:1cc:d981:a3a4 with SMTP id h3-20020a170902680300b001ccd981a3a4mr5920416plk.31.1699605939651;
        Fri, 10 Nov 2023 00:45:39 -0800 (PST)
Received: from ubuntu.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id y7-20020a1709029b8700b001c611e9a5fdsm4839413plp.306.2023.11.10.00.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 00:45:39 -0800 (PST)
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
Subject: [PATCH] Fixes the null pointer deferences in nsim_bpf
Date: Fri, 10 Nov 2023 08:44:26 +0000
Message-Id: <20231110084425.2123-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
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
in two functions nsim_prog_set_loaded and nsim_setup_prog_hw_checks

Reported-by: syzbot+44c2416196b7c607f226@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com./bug?extid=44c2416196b7c607f226

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/net/netdevsim/bpf.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
index f60eb97e3a62..e407efb0e3de 100644
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
@@ -317,10 +318,12 @@ nsim_setup_prog_hw_checks(struct netdevsim *ns, struct netdev_bpf *bpf)
 	}
 
 	state = bpf->prog->aux->offload->dev_priv;
-	if (WARN_ON(strcmp(state->state, "xlated"))) {
-		NSIM_EA(bpf->extack, "offloading program in bad state");
-		return -EINVAL;
-	}
+	if (state) {
+		if (WARN_ON(strcmp(state->state, "xlated"))) {
+			NSIM_EA(bpf->extack, "offloading program in bad state");
+			return -EINVAL;
+		}
+	}
 	return 0;
 }
 
-- 
2.34.1

