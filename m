Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6BEC6FA99
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Mar 2023 20:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43589416DF;
	Fri, 10 Mar 2023 20:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43589416DF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JFvBWiv4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EX5sXLLx0Oaf; Fri, 10 Mar 2023 20:28:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2700940592;
	Fri, 10 Mar 2023 20:28:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2700940592
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F4000C0071;
	Fri, 10 Mar 2023 20:28:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D7DDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Mar 2023 20:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 353E5414E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Mar 2023 20:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 353E5414E5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JFvBWiv4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kr-r4uxJVA0P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Mar 2023 20:28:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA56B410AF
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA56B410AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Mar 2023 20:28:18 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x3so25345643edb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Mar 2023 12:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678480097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nj5Pya6YtC6FZkwNt6VTrCVc/MqS8ZrcuQEjsXDc0Os=;
 b=JFvBWiv4O29p9nkvZSyqySeXpLFWrG/dvB8Xwadh0onr6XyucS682UvOyAD2WFt2+Z
 m+K0SA8O4Fivr18xiFdKwVSXouWTNf0AdrQNHTrM5G1heBYP9CfrPfB81JZ22yp8A24R
 xygIOCHAnxYWNvHA02XbLsa0szktm21/HsHEpZanepim9l0UYc1fdHQnsRXE5Q8xSbLq
 FKGHM4kkXEowNcwDs+O1x64Enm8hzlKAJ4VOOO6B7lwHxdUvknRQHOOK9uw+RYjKY5pl
 8cNM95rZ4oW7iG2a8xJXNzY4tJZ54GDQhPnmzhYNvF1Qesv3Q2l1GBosJUlFVX993vM+
 xa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678480097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nj5Pya6YtC6FZkwNt6VTrCVc/MqS8ZrcuQEjsXDc0Os=;
 b=l4c+WCdd1twOb+uNoiFSbS0FJe3DxtmQC1+88BGe6+4obhHztR95P04MWckblgPYtN
 ljNIghQuwCJje4fdZSTB3qUCAQ8/ogDZD7PbfSHimu/TlfJKWJ+bLsI/KODfELc3qqal
 DoCN/s0AWmgzQQ2akuEzUZPyoMT52yPW1WuKQWxSr6ED0VWBHmY/07flZmUACAKtyasw
 rTn4i74lb8dyax+qBrUUxf0n7L+182MhLgAg/RU7wrzar0BNirrENGfC4SS3j00pNaEX
 45FAbC6fblNmgJ8SEvSeZMbc9Y55rdeRALZXT05fK5Nn1Jwi4gp3PShMoWu2gU/i93VT
 DhtA==
X-Gm-Message-State: AO0yUKV3tOHqvZk4hnctb0pxzIFronH6iUrVFRztPjXcg2nEmkEOu4HM
 GhXuLHm0KvNR8aL49zaKsXc=
X-Google-Smtp-Source: AK7set/7HZ8W4oEzbgBOxclON9yaE4uHyP6GY9Kv1zpo6Of02/JFJNnPOCT6n6xfDGMxnkAjfBNAYQ==
X-Received: by 2002:a17:906:208a:b0:889:d24e:6017 with SMTP id
 10-20020a170906208a00b00889d24e6017mr3644384ejq.3.1678480096443; 
 Fri, 10 Mar 2023 12:28:16 -0800 (PST)
Received: from ivan-HLYL-WXX9.. ([37.252.81.68])
 by smtp.gmail.com with ESMTPSA id
 xa6-20020a170907b9c600b008b26f3d45fbsm260551ejc.143.2023.03.10.12.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 12:28:16 -0800 (PST)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: ericvh@gmail.com, lucho@ionkov.net, asmadeus@codewreck.org,
 linux_oss@crudebyte.com
Subject: [PATCH] 9P FS: Fix wild-memory-access write in v9fs_get_acl
Date: Sat, 11 Mar 2023 00:26:19 +0400
Message-Id: <20230310202619.433269-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org,
 syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com,
 v9fs-developer@lists.sourceforge.net,
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

KASAN reported the following issue:
[   36.825817][ T5923] BUG: KASAN: wild-memory-access in v9fs_get_acl+0x1a4/0x390
[   36.827479][ T5923] Write of size 4 at addr 9fffeb37f97f1c00 by task syz-executor798/5923
[   36.829303][ T5923]
[   36.829846][ T5923] CPU: 0 PID: 5923 Comm: syz-executor798 Not tainted 6.2.0-syzkaller-18302-g596b6b709632 #0
[   36.832110][ T5923] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/21/2023
[   36.834464][ T5923] Call trace:
[   36.835196][ T5923]  dump_backtrace+0x1c8/0x1f4
[   36.836229][ T5923]  show_stack+0x2c/0x3c
[   36.837100][ T5923]  dump_stack_lvl+0xd0/0x124
[   36.838103][ T5923]  print_report+0xe4/0x4c0
[   36.839068][ T5923]  kasan_report+0xd4/0x130
[   36.840052][ T5923]  kasan_check_range+0x264/0x2a4
[   36.841199][ T5923]  __kasan_check_write+0x2c/0x3c
[   36.842216][ T5923]  v9fs_get_acl+0x1a4/0x390
[   36.843232][ T5923]  v9fs_mount+0x77c/0xa5c
[   36.844163][ T5923]  legacy_get_tree+0xd4/0x16c
[   36.845173][ T5923]  vfs_get_tree+0x90/0x274
[   36.846137][ T5923]  do_new_mount+0x25c/0x8c8
[   36.847066][ T5923]  path_mount+0x590/0xe58
[   36.848147][ T5923]  __arm64_sys_mount+0x45c/0x594
[   36.849273][ T5923]  invoke_syscall+0x98/0x2c0
[   36.850421][ T5923]  el0_svc_common+0x138/0x258
[   36.851397][ T5923]  do_el0_svc+0x64/0x198
[   36.852398][ T5923]  el0_svc+0x58/0x168
[   36.853224][ T5923]  el0t_64_sync_handler+0x84/0xf0
[   36.854293][ T5923]  el0t_64_sync+0x190/0x194

Calling '__v9fs_get_acl' method in 'v9fs_get_acl' creates the
following chain of function calls:

__v9fs_get_acl
	v9fs_fid_get_acl
		v9fs_fid_xattr_get
			p9_client_xattrwalk

Function p9_client_xattrwalk accepts a pointer to u64-typed
variable attr_size and puts some u64 value into it. However,
after the executing the p9_client_xattrwalk, in some circumstances
we assign the value of u64-typed variable 'attr_size' to the
variable 'retval', which we will return. However, the type of
'retval' is ssize_t, and if the value of attr_size is larger
than SSIZE_MAX, we will face the signed type overflow. If the
overflow occurs, the result of v9fs_fid_xattr_get may be
negative, but not classified as an error. When we try to allocate
an acl with 'broken' size we receive an error, but don't process
it. When we try to free this acl, we face the 'wild-memory-access'
error (because it wasn't allocated).

This patch will modify the condition in the 'v9fs_fid_xattr_get'
function, so it will return an error if the 'attr_size' is larger
than SSIZE_MAX.

Reported-by: syzbot+cb1d16facb3cc90de5fb@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=fbbef66d9e4d096242f3617de5d14d12705b4659
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 fs/9p/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/9p/xattr.c b/fs/9p/xattr.c
index 50f7f3f6b55e..d6f7450107a8 100644
--- a/fs/9p/xattr.c
+++ b/fs/9p/xattr.c
@@ -35,7 +35,7 @@ ssize_t v9fs_fid_xattr_get(struct p9_fid *fid, const char *name,
 		return retval;
 	}
 	if (attr_size > buffer_size) {
-		if (!buffer_size) /* request to get the attr_size */
+		if (!buffer_size && attr_size <= (u64) SSIZE_MAX) /* request to get the attr_size */
 			retval = attr_size;
 		else
 			retval = -ERANGE;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
