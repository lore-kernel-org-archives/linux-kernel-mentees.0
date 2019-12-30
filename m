Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA06C2D0DC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7202920663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwqnaEx5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7202920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 66784203FA;
	Mon, 30 Dec 2019 04:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m+RxkGI86yDX; Mon, 30 Dec 2019 04:56:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B45D5203F9;
	Mon, 30 Dec 2019 04:56:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4961C18DC;
	Mon, 30 Dec 2019 04:56:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E33AC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1D2E784514
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmM8VVe3YBJv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 834A581E5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:33 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id d5so7319488pjz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 20:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uR3f0Y5+qpw7GzuSpDtOazUC6VJQJeKwTwbFDTwTBCA=;
 b=HwqnaEx5Oed746uNHaDbdB0lhTBpW8fy9FmMAJuCeWagTTz9H+T+AwTmYZsDZVQ6eL
 v3nh7acYh86xwxU1qg55GWpXfqwMbz0M9FkCcAtjAjYhj9WenaeTyyvjDFMrnd6zhXH/
 mM8HgFu6sq+pqZkG/43PAbbwnm+SvIsHfzK81bbUty2GqzLt4I+XkLIcKznJD62jMZRw
 I0w2loPFqPwIKIudX5G+I1HJCXa3YKZD8YTwLbc1em7SlU+x5nodVK37aMe+hn6PEW8M
 drlOVuBs6DYy9zQY3CuaEYg6C2KPysBXtLLzj4eXzg9R9LbFP18FIMMjWv3O6bdqaVC3
 l8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uR3f0Y5+qpw7GzuSpDtOazUC6VJQJeKwTwbFDTwTBCA=;
 b=bmO3+qAVzMxozd4aug8Br3TmeIUYs4JgDx+6J737PHbM5MhcWcBn4xzHMQbW6YvotY
 V8kEPQgXn0HGvlPVE36LxbLyC8v1X+kODJn9o/GSUokRpWL26SiaFI93WYp/81mC5/aT
 vMJI9bd1h6MJ3KEmSyinKe8wFKWGoH/LjyMlCvZ0tNIj1Ilbm7pg8ylIshabRyt6YjGX
 WfNCNo7jDNXukgzX9xpW2/xUM9k7jcYdgzazWXbWWbobiXiHEAebUw+HEURGgVNsEwk4
 Ze16R7SAXS8cV+5h9zg36vawRqzcLu7OkEZrwxXmj4kOxTS8O2/l4H6DMo7Uo6cP6mLr
 hopw==
X-Gm-Message-State: APjAAAU71t/CFyzPY4hx08m/m/i07nsWW+kkeOuVOS2BL0vwkwhssVgv
 xUaF+tINk6IgAkvSYakBnac=
X-Google-Smtp-Source: APXvYqztuuB2ij0gikUpdeX4d1JrByxjcpNSZFCIlBHanLa2ETk/AbCTINkkKUrYxt1xsld0wYndSA==
X-Received: by 2002:a17:902:b408:: with SMTP id
 x8mr67131998plr.326.1577681792979; 
 Sun, 29 Dec 2019 20:56:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id b1sm22373189pjw.4.2019.12.29.20.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 20:56:32 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 01:55:59 -0300
Message-Id: <0063476e939087c87678a68dfd7fbab2e2d57bb9.1577681164.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681164.git.dwlsalmeida@gmail.com>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 5/8] Documentation: nfs: idmapper:
	convert to ReST
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Convert idmapper.txt to ReST and move it to admin-guide.
Content remains mostly unchanged otherwise.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/nfs/index.rst       |  1 +
 .../nfs/nfs-idmapper.rst}                     | 31 ++++++++++---------
 2 files changed, 18 insertions(+), 14 deletions(-)
 rename Documentation/{filesystems/nfs/idmapper.txt => admin-guide/nfs/nfs-idmapper.rst} (81%)

diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
index c73ba9c16b77..c90fd5ebc640 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -9,4 +9,5 @@ NFS
     nfsroot
     nfs-rdma
     nfsd-admin-interfaces
+    nfs-idmapper
 
diff --git a/Documentation/filesystems/nfs/idmapper.txt b/Documentation/admin-guide/nfs/nfs-idmapper.rst
similarity index 81%
rename from Documentation/filesystems/nfs/idmapper.txt
rename to Documentation/admin-guide/nfs/nfs-idmapper.rst
index b86831acd583..58b8e63412d5 100644
--- a/Documentation/filesystems/nfs/idmapper.txt
+++ b/Documentation/admin-guide/nfs/nfs-idmapper.rst
@@ -1,7 +1,7 @@
+=============
+NFS ID Mapper
+=============
 
-=========
-ID Mapper
-=========
 Id mapper is used by NFS to translate user and group ids into names, and to
 translate user and group names into ids.  Part of this translation involves
 performing an upcall to userspace to request the information.  There are two
@@ -20,22 +20,24 @@ legacy rpc.idmap daemon for the id mapping.  This result will be stored
 in a custom NFS idmap cache.
 
 
-===========
 Configuring
 ===========
+
 The file /etc/request-key.conf will need to be modified so /sbin/request-key can
 direct the upcall.  The following line should be added:
 
-#OP	TYPE	DESCRIPTION	CALLOUT INFO	PROGRAM ARG1 ARG2 ARG3 ...
-#======	=======	===============	===============	===============================
-create	id_resolver	*	*		/usr/sbin/nfs.idmap %k %d 600
+``#OP	TYPE	DESCRIPTION	CALLOUT INFO	PROGRAM ARG1 ARG2 ARG3 ...``
+``#======	=======	===============	===============	===============================``
+``create	id_resolver	*	*		/usr/sbin/nfs.idmap %k %d 600``
+
 
 This will direct all id_resolver requests to the program /usr/sbin/nfs.idmap.
 The last parameter, 600, defines how many seconds into the future the key will
 expire.  This parameter is optional for /usr/sbin/nfs.idmap.  When the timeout
 is not specified, nfs.idmap will default to 600 seconds.
 
-id mapper uses for key descriptions:
+id mapper uses for key descriptions::
+
 	  uid:  Find the UID for the given user
 	  gid:  Find the GID for the given group
 	 user:  Find the user  name for the given UID
@@ -45,23 +47,24 @@ You can handle any of these individually, rather than using the generic upcall
 program.  If you would like to use your own program for a uid lookup then you
 would edit your request-key.conf so it look similar to this:
 
-#OP	TYPE	DESCRIPTION	CALLOUT INFO	PROGRAM ARG1 ARG2 ARG3 ...
-#======	=======	===============	===============	===============================
-create	id_resolver	uid:*	*		/some/other/program %k %d 600
-create	id_resolver	*	*		/usr/sbin/nfs.idmap %k %d 600
+``#OP	TYPE	DESCRIPTION	CALLOUT INFO	PROGRAM ARG1 ARG2 ARG3 ...``
+``#======	=======	===============	===============	===============================``
+``create	id_resolver	uid:*	*		/some/other/program %k %d 600``
+``create	id_resolver	*	*		/usr/sbin/nfs.idmap %k %d 600``
+
 
 Notice that the new line was added above the line for the generic program.
 request-key will find the first matching line and corresponding program.  In
 this case, /some/other/program will handle all uid lookups and
 /usr/sbin/nfs.idmap will handle gid, user, and group lookups.
 
-See <file:Documentation/security/keys/request-key.rst> for more information
+See Documentation/security/keys/request-key.rst for more information
 about the request-key function.
 
 
-=========
 nfs.idmap
 =========
+
 nfs.idmap is designed to be called by request-key, and should not be run "by
 hand".  This program takes two arguments, a serialized key and a key
 description.  The serialized key is first converted into a key_serial_t, and
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
