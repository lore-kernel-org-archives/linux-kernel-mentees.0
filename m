Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1202C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 09:49:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E0860F11
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 09:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58E0860F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 298404020C;
	Mon,  2 Aug 2021 09:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgNlhtKtKb6a; Mon,  2 Aug 2021 09:49:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 35E03401E4;
	Mon,  2 Aug 2021 09:49:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C361C0010;
	Mon,  2 Aug 2021 09:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0536CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E011E82DD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rF1RiJ6EzIN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:49:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07F7F82D96
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 09:49:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="213152566"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="213152566"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 02:49:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="520446499"
Received: from mariaf7x-mobl.amr.corp.intel.com (HELO [10.252.52.214])
 ([10.252.52.214])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 02:49:31 -0700
Subject: Re: [PATCH v2 1/2] locking/lockdep: Provide lockdep_assert{, _once}()
 helpers
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com,
 boqun.feng@gmail.com
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
 <20210731082458.1962043-2-desmondcheongzx@gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <1450737c-719f-34ec-4d0f-581d8ac853ac@linux.intel.com>
Date: Mon, 2 Aug 2021 11:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210731082458.1962043-2-desmondcheongzx@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

Op 31-07-2021 om 10:24 schreef Desmond Cheong Zhi Xi:
> From: Peter Zijlstra <peterz@infradead.org>
>
> Extract lockdep_assert{,_once}() helpers to more easily write composite
> assertions like, for example:
>
> 	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
> 		       lockdep_is_held(&drm_file.master_lookup_lock));
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Acked-by: Boqun Feng <boqun.feng@gmail.com>
> Acked-by: Waiman Long <longman@redhat.com>
> ---
>  include/linux/lockdep.h | 41 +++++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
>
> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> index 5cf387813754..9fe165beb0f9 100644
> --- a/include/linux/lockdep.h
> +++ b/include/linux/lockdep.h
> @@ -306,31 +306,29 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
>  
>  #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
>  
> -#define lockdep_assert_held(l)	do {					\
> -		WARN_ON(debug_locks &&					\
> -			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
> -	} while (0)
> +#define lockdep_assert(cond)		\
> +	do { WARN_ON(debug_locks && !(cond)); } while (0)
>  
> -#define lockdep_assert_not_held(l)	do {				\
> -		WARN_ON(debug_locks &&					\
> -			lockdep_is_held(l) == LOCK_STATE_HELD);		\
> -	} while (0)
> +#define lockdep_assert_once(cond)	\
> +	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
>  
> -#define lockdep_assert_held_write(l)	do {			\
> -		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
> -	} while (0)
> +#define lockdep_assert_held(l)		\
> +	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
>  
> -#define lockdep_assert_held_read(l)	do {				\
> -		WARN_ON(debug_locks && !lockdep_is_held_type(l, 1));	\
> -	} while (0)
> +#define lockdep_assert_not_held(l)	\
> +	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
>  
> -#define lockdep_assert_held_once(l)	do {				\
> -		WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));	\
> -	} while (0)
> +#define lockdep_assert_held_write(l)	\
> +	lockdep_assert(lockdep_is_held_type(l, 0))
>  
> -#define lockdep_assert_none_held_once()	do {				\
> -		WARN_ON_ONCE(debug_locks && current->lockdep_depth);	\
> -	} while (0)
> +#define lockdep_assert_held_read(l)	\
> +	lockdep_assert(lockdep_is_held_type(l, 1))
> +
> +#define lockdep_assert_held_once(l)		\
> +	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
> +
> +#define lockdep_assert_none_held_once()		\
> +	lockdep_assert_once(!current->lockdep_depth)
>  
>  #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
>  
> @@ -407,6 +405,9 @@ extern int lock_is_held(const void *);
>  extern int lockdep_is_held(const void *);
>  #define lockdep_is_held_type(l, r)		(1)
>  
> +#define lockdep_assert(c)			do { } while (0)
> +#define lockdep_assert_once(c)			do { } while (0)
> +
>  #define lockdep_assert_held(l)			do { (void)(l); } while (0)
>  #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
>  #define lockdep_assert_held_write(l)		do { (void)(l); } while (0)

All other macros seem to do (void)(c); in this case?


Otherwise looks good.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
