Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E63EC6FD20
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Mar 2023 09:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0272D40461;
	Fri, 24 Mar 2023 09:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0272D40461
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=alexanderheinrich.de header.i=@alexanderheinrich.de header.a=rsa-sha256 header.s=sig1 header.b=GtP+R4U+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnsFw9DvaINL; Fri, 24 Mar 2023 09:28:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 73B9940153;
	Fri, 24 Mar 2023 09:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73B9940153
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 512DCC0035;
	Fri, 24 Mar 2023 09:28:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07B5DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 09:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9A2D40286
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 09:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A2D40286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoJgVxqR9meH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 09:28:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFC9B40153
Received: from mr85p00im-hyfv06021301.me.com (mr85p00im-hyfv06021301.me.com
 [17.58.23.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFC9B40153
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alexanderheinrich.de; s=sig1; t=1679650100;
 bh=dSIP2LzeNErC/REZ3YYpHWBfpceHVAG0VrcUXi0c7wY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=GtP+R4U+2NT6YZdtXGqJulgPkAHBuNGn3Nb8kzJNC8DXNJVLJyWEzivdAPX0xobkB
 27w3dyp+ms2VNX00yvYIqDu9fW4UJh1lRyRAfBApfXYim3KhSrnAwCtq7gcMWXOG5y
 ZSSF1LtdlQGM7W3c4VwViisRLBcVFlC7PVGXX2uek+1euao5KUfOn8I0cgtv2yG/6p
 I1G1yP8nGUAtZH9gim/ScJQl6FaSX5XvqGPM6eRWNhnBF1MfZlP2NvF902Lt5WvbT4
 cJeQIi7rfy5lUM4ctaSHQzkD2GjxtEGKJh9/6UGCN/U9cZf9BzrojTIV4EYq6TQB2K
 sOIdYYS+ifTSg==
Received: from pop-os.fritz.box (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-hyfv06021301.me.com (Postfix) with ESMTPSA id BC7EE2153DBB;
 Fri, 24 Mar 2023 09:28:17 +0000 (UTC)
From: Alexander Heinrich <hallo@alexanderheinrich.de>
To: broonie@kernel.org
Subject: [PATCH] kselftest/alsa: Fix -Wformat compiler warnings
Date: Fri, 24 Mar 2023 10:28:06 +0100
Message-Id: <20230324092806.363253-1-hallo@alexanderheinrich.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: E8rPtdu249mJUmVqZ_fGbtucqjEIp1pk
X-Proofpoint-ORIG-GUID: E8rPtdu249mJUmVqZ_fGbtucqjEIp1pk
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=472
 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1030 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2303240078
Cc: shuah@kernel.org, tiwai@suse.com, perex@perex.cz,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

I noticed some -Wformat compiler warnings in pcm-test.c while building
kselftest, fix them by using the same types for format specifier and arguments.

Signed-off-by: Alexander Heinrich <hallo@alexanderheinrich.de>
---
 tools/testing/selftests/alsa/pcm-test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/alsa/pcm-test.c b/tools/testing/selftests/alsa/pcm-test.c
index 58b525a4a32c..44fc5f826ab5 100644
--- a/tools/testing/selftests/alsa/pcm-test.c
+++ b/tools/testing/selftests/alsa/pcm-test.c
@@ -371,7 +371,7 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 		goto __close;
 	}
 	if (rrate != rate) {
-		snprintf(msg, sizeof(msg), "rate mismatch %ld != %ld", rate, rrate);
+		snprintf(msg, sizeof(msg), "rate mismatch %ld != %d", rate, rrate);
 		goto __close;
 	}
 	rperiod_size = period_size;
@@ -437,24 +437,24 @@ static void test_pcm_time(struct pcm_data *data, enum test_class class,
 			frames = snd_pcm_writei(handle, samples, rate);
 			if (frames < 0) {
 				snprintf(msg, sizeof(msg),
-					 "Write failed: expected %d, wrote %li", rate, frames);
+					 "Write failed: expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 			if (frames < rate) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 		} else {
 			frames = snd_pcm_readi(handle, samples, rate);
 			if (frames < 0) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 			if (frames < rate) {
 				snprintf(msg, sizeof(msg),
-					 "expected %d, wrote %li", rate, frames);
+					 "expected %ld, wrote %li", rate, frames);
 				goto __close;
 			}
 		}
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
