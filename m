Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63903E8FDA9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Oct 2023 19:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA97341864;
	Tue,  3 Oct 2023 19:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA97341864
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TCUJ2A2n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OyIwMThCtnZa; Tue,  3 Oct 2023 19:43:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E4636401B2;
	Tue,  3 Oct 2023 19:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4636401B2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC5A9C0039;
	Tue,  3 Oct 2023 19:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 594AEC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 19:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 282B160BBC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 19:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 282B160BBC
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TCUJ2A2n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNxKGpraIWNN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 19:43:30 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D73560AB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Oct 2023 19:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D73560AB2
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c6219307b2so9682405ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Oct 2023 12:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696362210; x=1696967010;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MbdHdhO4/8XQFhe6TXvhjzuMCQeWe1W0DXY8haIPqBM=;
 b=TCUJ2A2neD4f0oIeYPcw2Q4qtkEi38gQMgBJW77wi8R+uk8UHBBorbflOL/ju54MR+
 S74I6laaMLWTOy0ZzdktdtgPhLXKO65CzN3SHiwJXIzhfR2akgGpVkOTu6y2olqczDKI
 aCg4em8qwKGpbyW5UkTXjZaRa73NoCFXf/PjvYqNhhNXjBnkGIE/Dzk6AT3RcOiZCYqG
 HDn+iNMDo7RiRDGNPvl9XOGl9/sUtGzv0gL/W2DLzP03YuT7SmXEXGeOe7n562gdtbe0
 HPH010YU4pk3cAMSUspCJnJWpxOugeb09ES3HBtOcXIAiqkMyr8WG97WrgSUi4Y0Gl0g
 legg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696362210; x=1696967010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MbdHdhO4/8XQFhe6TXvhjzuMCQeWe1W0DXY8haIPqBM=;
 b=Gku6ksj0qtKRe2zPU3HpfXr5Uu38XDNB7Zs4L7kU5rRJ2qBMaVOyFjMIrfTUqvqpXz
 Fv93RoWyvN6qzK7dB2GgzMtP4OHoK0osb6UTuketPGC67sqvazrZ8Op6L0uFJ4sE/C4y
 jIRI1aRUg7jIqqpPfcDS/tx1HmVBNUfR5L9ke5A+6+GI3r7eSFAxOOsuNCFWjHp9O7BP
 rlQ4/6vTsaHJ25lPRqzf1P5XzgC8ZBd2U5gVmT/OZ4Lbtkosx57AvJif5l5eCX2y9yJf
 I4M4GLOF3q16euJihU/wotmsEpLdSrgxt0T+/jSkXhEl5Pbcrq9t5TWsUvkMqrCtawyt
 lY4w==
X-Gm-Message-State: AOJu0YwtmBlHibxYYTac8OrYeaQvb5/y+0qMY2vPbd5Ef8st4/DBX8tU
 zeN6hj0CtfPAwUkEoPNR+SE=
X-Google-Smtp-Source: AGHT+IE8Zzd5tPTms4qpIkKaLgA/vVn5aDnp/RRxtPIznkHxLLVZPVZ1k3dVVvKti/qDIrBu38AJSg==
X-Received: by 2002:a17:902:d4cd:b0:1c4:3294:74ca with SMTP id
 o13-20020a170902d4cd00b001c4329474camr590332plg.17.1696362209640; 
 Tue, 03 Oct 2023 12:43:29 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a170903244800b001bc2831e1a9sm1989965pls.90.2023.10.03.12.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 12:43:29 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: adobriyan@gmail.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org, hughd@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] selftests:proc Add /proc/$(pid)/statm output validation
Date: Wed,  4 Oct 2023 01:13:19 +0530
Message-Id: <20231003194319.602646-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZRsDWFxy3rcILfxg@swarup-virtual-machine>
References: <ZRsDWFxy3rcILfxg@swarup-virtual-machine>
MIME-Version: 1.0
Cc: swarupkotikalapudi@gmail.com
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

Add /proc/${pid}/statm validation

/proc/$(pid)/statm output is expected to be:
 "0 0 0 * 0 0 0\n"
Here * can be any value

Read output of /proc/$(pid)/statm
and check except for 4th position,
all other positions have value zero.

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
Changes in V2:
- 4th field if zero it will assert
- field other than 4th field is checked for zero value
- clean up of function test_proc_pid_statm()

Changes in V1:
- added new function test_proc_pid_statm()

 tools/testing/selftests/proc/proc-empty-vm.c | 57 ++++++++++++++++++--
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b16c13688b88..1b5b48445e0f 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -302,6 +302,56 @@ static int test_proc_pid_smaps_rollup(pid_t pid)
 	}
 }
 
+static int test_proc_pid_statm(pid_t pid)
+{
+	char buf[4096];
+	char *tok;
+	char *string;
+	int non_zero_value_indx = 4;
+	int i = 1;
+
+	snprintf(buf, sizeof(buf), "/proc/%u/statm", pid);
+
+	/*
+	 *  Output can be "0 0 0 2 0 0 0\n" where "2" can be anything.
+	 */
+	int fd = open(buf, O_RDONLY);
+
+	if (fd == -1) {
+		if (errno == ENOENT) {
+			/*
+			 * /proc/${pid}/statm is under CONFIG_PROC_PAGE_MONITOR,
+			 * it doesn't necessarily exist.
+			 */
+			return EXIT_SUCCESS;
+		}
+		perror("open /proc/${pid}/statm");
+		return EXIT_FAILURE;
+	} else {
+		ssize_t rv = read(fd, buf, sizeof(buf));
+
+		close(fd);
+		assert(rv);
+		string = buf;
+
+		while ((tok = strsep(&string, " ")) != NULL) {
+			if (i == non_zero_value_indx) {
+				if (!strncmp(tok, "0", 1))
+					goto err_statm;
+			} else {
+				if (strncmp(tok, "0", 1))
+					goto err_statm;
+			}
+			i++;
+		}
+	}
+
+	return EXIT_SUCCESS;
+
+err_statm:
+	assert(0);
+}
+
 int main(void)
 {
 	int rv = EXIT_SUCCESS;
@@ -388,11 +438,8 @@ int main(void)
 		if (rv == EXIT_SUCCESS) {
 			rv = test_proc_pid_smaps_rollup(pid);
 		}
-		/*
-		 * TODO test /proc/${pid}/statm, task_statm()
-		 * ->start_code, ->end_code aren't updated by munmap().
-		 * Output can be "0 0 0 2 0 0 0\n" where "2" can be anything.
-		 */
+		if (rv == EXIT_SUCCESS)
+			rv = test_proc_pid_statm(pid);
 
 		/* Cut the rope. */
 		int wstatus;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
