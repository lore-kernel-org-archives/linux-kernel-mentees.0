Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5C4CE7A8C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Sep 2023 18:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2FAB60A93;
	Sun, 24 Sep 2023 18:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2FAB60A93
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=claudiocambra.com header.i=@claudiocambra.com header.a=rsa-sha256 header.s=sig1 header.b=na8+TlhC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fz8tdC9f8L4K; Sun, 24 Sep 2023 18:41:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CF49160A91;
	Sun, 24 Sep 2023 18:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF49160A91
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9289FC0039;
	Sun, 24 Sep 2023 18:41:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 703BFC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Sep 2023 18:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14FC040A95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Sep 2023 18:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14FC040A95
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=claudiocambra.com header.i=@claudiocambra.com
 header.a=rsa-sha256 header.s=sig1 header.b=na8+TlhC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EniKj1ce3xsn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Sep 2023 18:41:33 +0000 (UTC)
Received: from pv50p00im-ztbu10021601.me.com (pv50p00im-ztbu10021601.me.com
 [17.58.6.57]) by smtp2.osuosl.org (Postfix) with ESMTPS id 375DE40A15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Sep 2023 18:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 375DE40A15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=claudiocambra.com;
 s=sig1; t=1695580891;
 bh=VQR4EtRBp7jWzudSp/FWLXg7bXlybMvQwwQhYXIOHTE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=na8+TlhClG6W/pLjdBT4WmQ7LPxT9XBcEO58pL68vD/uJVHtSqKhrs8c/zIdlwNSI
 ZX0rVjE2NEnQn6P69iGlTP3JHM61I0OyON3MWYKdKHgF9YLxvs4UxM4EA4peJjauP4
 0xGY3kGUdA7ltujJlQuG55vONgtqqLteQZxrI5BdsQDR4QuB4SlXFq1d82c8FH9IZv
 0+t+EMtskcu/O7PuGRbCpuzu291gKIfLEhafB+MihKRm6DS62vFaaV7fesAfXlaX9O
 c+fi9SWrfsd67UBl39vTdAc4nihXLy5vSAqq4JEGsUG/QR+vIoO22qrnG5aSd+DBoL
 uudd7RLXow00Q==
Received: from localhost.localdomain (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztbu10021601.me.com (Postfix) with ESMTPSA id 5680180262;
 Sun, 24 Sep 2023 18:41:28 +0000 (UTC)
From: Claudio Cambra <developer@claudiocambra.com>
To: skhan@linuxfoundation.org, ivan.orlov0322@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] docs: Fix Sphinx 8 warning caused by paths represented with
 strings
Date: Mon, 25 Sep 2023 02:40:57 +0800
Message-ID: <20230924184057.91861-1-developer@claudiocambra.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Proofpoint-GUID: 9S0jnjFqe4WtRWUxJnFWrNMT2F2RB_li
X-Proofpoint-ORIG-GUID: 9S0jnjFqe4WtRWUxJnFWrNMT2F2RB_li
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F01:2022-06-21=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0
 mlxlogscore=394 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2309240164
Cc: Claudio Cambra <developer@claudiocambra.com>
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

Running "make htmldocs" generates several lines of this warning:

Documentation/sphinx/kerneldoc.py:141: RemovedInSphinx80Warning: Sphinx 8 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
  doc = (env.srcdir + "/" + env.docname + ":" + str(self.lineno))

Making "doc" an fspath type and creating a new variable with the
appended colon and lineno fixes this warning.

Signed-off-by: Claudio Cambra <developer@claudiocambra.com>
---
 Documentation/sphinx/kerneldoc.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 9395892c7ba3..e2c835e10dba 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -138,7 +138,8 @@ class KernelDocDirective(Directive):
                     lineoffset = int(match.group(1)) - 1
                     # we must eat our comments since the upset the markup
                 else:
-                    doc = env.srcdir + "/" + env.docname + ":" + str(self.lineno)
+                    doc = os.path.join(env.srcdir, env.docname)
+                    doc_with_line = (doc + ":" + str(self.lineno))
                     result.append(line, doc + ": " + filename, lineoffset)
                     lineoffset += 1
 
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
