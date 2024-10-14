Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5011D1F73
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 21:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728941828; cv=none; b=TYRSj6JYYYD80UerJgVLwQL2mFbw56G909zzxmPD+KffCA/qMIuvaW84VJ+8jVwsSX+N8XsgM6hheviNrK7O+BkcA3u60O9/rygTGZhtarVHr7VME6iozsARUEncvHgQFGP6dHOOAzXLYEYg6yW17MkVGyNyp8ukPWGJrzFUQQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728941828; c=relaxed/simple;
	bh=HkOvPod5Po7IUxn9v8V3oIRI3nemGKR4kwPpRnttkkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yg9Le+2XpSOmGVbfTYlwRTNcYybgzDZGmpIggh6UyqiU52kykkZ2hQzXBG0GdCCW3N3k56TNetJAqVLpErCPLNSv++MMlaJ5ZJi3EiXkEDcVzDTXpz0u75+/7F0MuosxnQVEaC5PEe4lmvanN7eg1OF2NBiRKVp2cs88J/kv6dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+RQycOH; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+RQycOH"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298A081111
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJAGrYnL1a6q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Oct 2024 21:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=leocstone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C80181191
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C80181191
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C+RQycOH
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1C80181191
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 21:37:05 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-656d8b346d2so2965370a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728941825; x=1729546625; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyvt4hfWvi2xjwmIhjL6WdR6crEcwqI6hT3ogZy/zXA=;
        b=C+RQycOHAZHgMyM8RqbpUpFn4FopVz8PB9h/v8nMNVLbPwga3bBYmNzimp5RfY122/
         Dx2oSiYqXFJhI6udSRx4cbNWdepmvp8ATeKV+ZgQSAwjX6Ywn/osfPT/Bl8xSVmkER8n
         vhuWNrvcGmw2CZwz8NG3GivIo0h7cyVSJIXm3iCBq6ubbhJPEiwcsk84LXNmcX4g2emT
         bKZL0UeAhzUc95OVGI8oq4+dE1iaLB50QMS/ET+MGzYQVjxjecrv2PlQ/qQFsRD1YPkb
         BT8KNTYqxUA6eBQ4E5uVqFNPHRDDBHNPtVhhrWUwZiMfyuIVQV7jAqZzvq3Yo6WQdtCM
         +ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728941825; x=1729546625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyvt4hfWvi2xjwmIhjL6WdR6crEcwqI6hT3ogZy/zXA=;
        b=sgCDMcJBgS8Iw/PtRl+toZEU5bllmO5Wy8++1nXebKWcPNJ6/6tXB6qsjIwarrnBjB
         uLJMAdHfpf/NqG4CZgddY7oq9eeOzOiYUtrnq9eFKO+BwsiiqFdEnugMzTNM1We7dyUc
         eTSLZofs3J08d/EoIC13sYqrwl1luS1r1HdDikYKieDVaiC0hHz3jbMUNDHdlZ1gZZ7x
         +MtWBQrhGsyurE41dSk4wJgiHw0ErpaeUCeByp/lFztf+JCJdaNyi5drh9xzIgY0ANvK
         p2B+iQ+h5lN422hV8k5eBkvgFmiDEREBES+QSZsl4oSrK4GXFNbqPYL+udqx8emYqzJ2
         irCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN1LsF/JjgoGG/cUFTxgDpqKOGo4F8WQWxQygifvcv+CFx0yas8KZYE3BvjJRDkT76BmZglGkYYM3loItYYy4risgaDA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx14VFna8Yqqscs/ymGrFHOysFQY0rhrq91tdrnmZmu+c4sVFx6
	y41ez3yzRdtlGROv613g3PSSq7SQXlQU/Gfd94HA5teJaJy6gT6m
X-Google-Smtp-Source: AGHT+IEM+CbuOlw1EC7rK8P2ZtDy8fBKPdQFPRlLr9/5qTPTuxcE1fCVaryv0nfmmb8t+WCK5h8jRw==
X-Received: by 2002:a05:6a20:2d1f:b0:1d8:6c7a:2f2d with SMTP id adf61e73a8af0-1d8c96ba64bmr13184084637.47.1728941824561;
        Mon, 14 Oct 2024 14:37:04 -0700 (PDT)
Received: from tc.hsd1.or.comcast.net ([2601:1c2:c104:170:a15c:9f17:806b:220f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e5d1d399dsm3502110b3a.136.2024.10.14.14.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 14:37:04 -0700 (PDT)
From: Leo Stone <leocstone@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	0x7f454c46@gmail.com
Cc: Leo Stone <leocstone@gmail.com>,
	rdunlap@infradead.org,
	mnassiri@ciena.com,
	jiapeng.chong@linux.alibaba.com,
	colin.i.king@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anupnewsmail@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RFC PATCH] selftest/tcp-ao: Add filter tests 
Date: Mon, 14 Oct 2024 14:33:08 -0700
Message-ID: <20241014213313.15100-1-leocstone@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests that check if getsockopt(TCP_AO_GET_KEYS) returns the right
keys when using different filters.

Sample output:

> # ok 114 filter keys: by sndid, rcvid, address
> # ok 115 filter keys: by sndid, rcvid
> # ok 116 filter keys: by is_current
> # ok 117 filter keys: by is_rnext

Signed-off-by: Leo Stone <leocstone@gmail.com>
---
This patch is meant to address the TODO in setsockopt-closed.c:
> /*
>  * TODO: check getsockopt(TCP_AO_GET_KEYS) with different filters
>  * returning proper nr & keys;
>  */

Is this a reasonable way to do these tests? If so, what cases should I
add?
---
 .../selftests/net/tcp_ao/setsockopt-closed.c  | 158 +++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/tcp_ao/setsockopt-closed.c b/tools/testing/selftests/net/tcp_ao/setsockopt-closed.c
index 084db4ecdff6..4c8aa06eef5a 100644
--- a/tools/testing/selftests/net/tcp_ao/setsockopt-closed.c
+++ b/tools/testing/selftests/net/tcp_ao/setsockopt-closed.c
@@ -6,6 +6,8 @@
 
 static union tcp_addr tcp_md5_client;
 
+#define FILTER_TEST_NKEYS 16
+
 static int test_port = 7788;
 static void make_listen(int sk)
 {
@@ -813,12 +815,166 @@ static void duplicate_tests(void)
 	setsockopt_checked(sk, TCP_AO_ADD_KEY, &ao, EEXIST, "duplicate: SendID differs");
 }
 
+
+static void fetch_all_keys(int sk, struct tcp_ao_getsockopt *keys)
+{
+	socklen_t optlen = sizeof(struct tcp_ao_getsockopt);
+
+	memset(keys, 0, sizeof(struct tcp_ao_getsockopt) * FILTER_TEST_NKEYS);
+	keys[0].get_all = 1;
+	keys[0].nkeys = FILTER_TEST_NKEYS;
+	if (getsockopt(sk, IPPROTO_TCP, TCP_AO_GET_KEYS, &keys[0], &optlen))
+		test_error("getsockopt");
+}
+
+static int prepare_test_keys(struct tcp_ao_getsockopt *keys)
+{
+	struct tcp_ao_add test_ao[FILTER_TEST_NKEYS];
+	u8 rcvid = 100, sndid = 100;
+	const char *test_password = "Test password number ";
+	char test_password_scratch[64] = {};
+	int sk = socket(test_family, SOCK_STREAM, IPPROTO_TCP);
+
+	if (sk < 0)
+		test_error("socket()");
+
+	for (int i = 0; i < FILTER_TEST_NKEYS; i++) {
+		snprintf(test_password_scratch, 64, "%s %d", test_password, i);
+		test_prepare_key(&test_ao[i], DEFAULT_TEST_ALGO, this_ip_dest, false, false,
+				 DEFAULT_TEST_PREFIX, 0, sndid++, rcvid++, 0, 0,
+				 strlen(test_password_scratch), test_password_scratch);
+	}
+	test_ao[0].set_current = 1;
+	test_ao[1].set_rnext = 1;
+	/* One key with a different addr and overlapping sndid, rcvid */
+	tcp_addr_to_sockaddr_in(&test_ao[2].addr, &this_ip_addr, 0);
+	test_ao[2].sndid = 100;
+	test_ao[2].rcvid = 100;
+
+	/* Add keys in a random order */
+	for (int i = 0; i < FILTER_TEST_NKEYS; i++) {
+		int randidx = rand() % (FILTER_TEST_NKEYS - i);
+
+		if (setsockopt(sk, IPPROTO_TCP, TCP_AO_ADD_KEY, &test_ao[randidx],
+			       sizeof(struct tcp_ao_add)))
+			test_error("setsockopt()");
+		memcpy(&test_ao[randidx], &test_ao[FILTER_TEST_NKEYS - 1 - i],
+				sizeof(struct tcp_ao_add));
+	}
+
+	fetch_all_keys(sk, keys);
+
+	return sk;
+}
+
+/* Assumes passwords are unique */
+static int compare_mkts(struct tcp_ao_getsockopt *expected, int nexpected,
+			struct tcp_ao_getsockopt *actual, int nactual)
+{
+	int matches = 0;
+
+	for (int i = 0; i < nexpected; i++) {
+		for (int j = 0; j < nactual; j++) {
+			if (memcmp(expected[i].key, actual[j].key, TCP_AO_MAXKEYLEN) == 0)
+				matches++;
+		}
+	}
+	return nexpected - matches;
+}
+
+static void filter_keys_checked(int sk, struct tcp_ao_getsockopt *filter,
+				struct tcp_ao_getsockopt *expected,
+				unsigned int nexpected, const char *tst)
+{
+	struct tcp_ao_getsockopt all_keys[FILTER_TEST_NKEYS] = {};
+	struct tcp_ao_getsockopt filtered_keys[FILTER_TEST_NKEYS] = {};
+	socklen_t len = sizeof(struct tcp_ao_getsockopt);
+
+	fetch_all_keys(sk, all_keys);
+	memcpy(&filtered_keys[0], filter, sizeof(struct tcp_ao_getsockopt));
+	filtered_keys[0].nkeys = FILTER_TEST_NKEYS;
+	if (getsockopt(sk, IPPROTO_TCP, TCP_AO_GET_KEYS, filtered_keys, &len))
+		test_error("getsockopt");
+	if (filtered_keys[0].nkeys != nexpected)
+		test_error("wrong nr of keys, expected %u got %u", nexpected,
+			   filtered_keys[0].nkeys);
+	if (compare_mkts(expected, nexpected, filtered_keys, filtered_keys[0].nkeys))
+		test_error("got wrong keys back");
+	test_ok("filter keys: %s", tst);
+
+	close(sk);
+	memset(filter, 0, sizeof(struct tcp_ao_getsockopt));
+}
+
+static void filter_tests(void)
+{
+	struct tcp_ao_getsockopt original_keys[FILTER_TEST_NKEYS];
+	struct tcp_ao_getsockopt expected_keys[FILTER_TEST_NKEYS];
+	struct tcp_ao_getsockopt filter = {};
+	int sk, f, nmatches;
+
+	f = 2;
+	sk = prepare_test_keys(original_keys);
+	filter.rcvid = original_keys[f].rcvid;
+	filter.sndid = original_keys[f].sndid;
+	memcpy(&filter.addr, &original_keys[f].addr, sizeof(original_keys[f].addr));
+	filter.prefix = original_keys[f].prefix;
+	filter_keys_checked(sk, &filter, &original_keys[f], 1, "by sndid, rcvid, address");
+
+	f = -1;
+	sk = prepare_test_keys(original_keys);
+	for (int i = 0; i < original_keys[0].nkeys; i++) {
+		if (original_keys[i].is_current) {
+			f = i;
+			break;
+		}
+	}
+	if (f < 0)
+		test_error("No current key after adding one");
+	filter.is_current = 1;
+	filter_keys_checked(sk, &filter, &original_keys[f], 1, "by is_current");
+
+	f = -1;
+	sk = prepare_test_keys(original_keys);
+	for (int i = 0; i < original_keys[0].nkeys; i++) {
+		if (original_keys[i].is_rnext) {
+			f = i;
+			break;
+		}
+	}
+	if (f < 0)
+		test_error("No rnext key after adding one");
+	filter.is_rnext = 1;
+	filter_keys_checked(sk, &filter, &original_keys[f], 1, "by is_rnext");
+
+	f = -1;
+	nmatches = 0;
+	sk = prepare_test_keys(original_keys);
+	for (int i = 0; i < original_keys[0].nkeys; i++) {
+		if (original_keys[i].sndid == 100) {
+			f = i;
+			memcpy(&expected_keys[nmatches], &original_keys[i],
+			       sizeof(struct tcp_ao_getsockopt));
+			nmatches++;
+		}
+	}
+	if (f < 0)
+		test_error("No key for sndid 100");
+	if (nmatches != 2)
+		test_error("Should have 2 keys with sndid 100");
+	filter.rcvid = original_keys[f].rcvid;
+	filter.sndid = original_keys[f].sndid;
+	filter.addr.ss_family = test_family;
+	filter_keys_checked(sk, &filter, expected_keys, nmatches, "by sndid, rcvid");
+}
+
 static void *client_fn(void *arg)
 {
 	if (inet_pton(TEST_FAMILY, __TEST_CLIENT_IP(2), &tcp_md5_client) != 1)
 		test_error("Can't convert ip address");
 	extend_tests();
 	einval_tests();
+	filter_tests();
 	duplicate_tests();
 	/*
 	 * TODO: check getsockopt(TCP_AO_GET_KEYS) with different filters
@@ -830,6 +986,6 @@ static void *client_fn(void *arg)
 
 int main(int argc, char *argv[])
 {
-	test_init(121, client_fn, NULL);
+	test_init(125, client_fn, NULL);
 	return 0;
 }
-- 
2.43.0

