Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE33314B8
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Nov 2025 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762274651; cv=none; b=TSKEcDQ96wqi/L7griixxuZuEExhldXGCyIFdm2K3zlMm26Pfd6uj5/MNPMf+t3DiWnjDShy2io7QTVSSQtUmEOGrGTwtUFo7aehXAEgsFZ5tMWWlpdHY8kQLhY/xWW8f5IxA4dj/W2/BfYweFh/P3SR3ghMq9dYChaX3N9jzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762274651; c=relaxed/simple;
	bh=+6f8Az2YKgzFu/1Z87heVILzg2DKfZEbBe/3yhgUVjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFTL9RU7B7zUbW1nqpT67R1WH4m33omE61YngzAW3oMhctGvvPKez6j40A2IQYQQxlN6OzzU19HjfsvPFsUTo9b+QqkfEU8KdQCQW16bDV1X5f5a73lRc5OQX+/iWPO9xBA0fMHTOFpeQJQtVq976cdhwbPbJLyVf2kAj5f3b2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwQ3XMrh; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwQ3XMrh"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so5011516a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Nov 2025 08:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762274646; x=1762879446; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XNBFrCMvQ0mThH8RnIZnBD+qXuvr6aMextqQVAw5+04=;
        b=iwQ3XMrhUNppBRmIpcX4RuQ34mzKqp+ZU0XVv4fKJU9PKDEnVlcDGMPiBZLVKAdNJ9
         4jDtWLDJjmJ8Qq/LEP5jDHaB6LibqxszocwcFEITkXloSYkZky3MdKgAm9Xr6NwyqFKj
         9sUhI2VWisGMRJ9jRwchBFMuPx4INtgmgKzbn5Q656JaoU6eoT5/UOZ7gN+jzRf668I7
         HOpTu2V6Xwx53tTeEaQMnXk+fSWo8NHFTkOIqH+wZHCFYsNa4aEWXD6SgNzIcZFz+XEv
         NTlgvwIBLYVylwY0qwZslV5V3GZcV+DAQLJkRELWPqFlUZfbOsEnJ0s+1gaAc6FxHTNg
         5MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762274646; x=1762879446;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNBFrCMvQ0mThH8RnIZnBD+qXuvr6aMextqQVAw5+04=;
        b=IVLOBm/KgMv+IOSALDsDHTnOmyZAL7LIEcolU4cVMlEEv5yzZ0fDJTlf5IwN9a+lp2
         +C8ro/XyusXUFlorUlWEA9Z2mDK1tH6AWa/zMwRp98OSoc2E2DhMXq+n6jnP7NPCpbWv
         C0yTQFeJPuWR6iXe+P4sTKnzvJBoY91vYZLWjKjOuI54a6i+XxA6hJYB/THEmBJynL2j
         ICNk7C3e/PGLEUGh372lAYZ6Q5wxMyCPmQAfnAPQFqiOyo+z0uWjK7DM0jGms6wHmrwx
         YT9bFQAQqTGNGN2Ab1ThKpM6od3MiQ3+EbTQLEJ+r+UVdyA79104kSeKace87Gz1h/8S
         qnRA==
X-Forwarded-Encrypted: i=1; AJvYcCXtD9yP38ADDRSVL+0ZVmWwUnb6obs+jmLJvhAJF6iaVjaMxQA9+nW+/wif7Y3VHJbGXR9PA8jqtRiuz1vH2g9mp5BTnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXHE0LlbFiQLRcmDVbOp9ddQLRahaQowjDnIjN/LzivhbBVR9X
	A95shZTzO5BRPOf4iBv6209Lb6/IsUuL9g/SIbekFElBd1dkpWc+f/s2pklKFZneL7f8/XRF7Gk
	9+TgtBD+DBSCsoKaa7Nr++U1tg8vvA/8=
X-Gm-Gg: ASbGncvQ+ca04+OJWaRlxiOQVNBLnXl2cWD6kvGQe042+EQTAoKWkwXekKZisXmhkNX
	WyGyQWJgqtAQmmvX1R6JONrCVwqi7HO8qXyeLHrjzCzqPwiwP21G1jTFF+VHBsYZ0+ihVNZ8VPq
	Xo4PBSY02W17zVtyzJf5NgF6/7W1Yohwvz4HS5ZSZcqiRzp4ERK+sYhm/VPXvgfXEw/Hb8vtqky
	/eUZXvGHwIiWDTI+QMb4qbmqJGbW15w2GLCHWv19aIEEE6Zk7BgLCvlGegjfMRRV+amXqv0DKzb
	l5JWrwrMGdV2YxoHT3/eQLIFr9Ut2v8ErdAobNaGfWl9
X-Google-Smtp-Source: AGHT+IHjKRUqUHXHludDe/1mTMPgI/bE/8w3FFf+wR3Yq2t0BQji2y5lXCG1ALms3jIeNLLaYlQ5zmmYHpd4jhJyH70=
X-Received: by 2002:a05:6402:90e:b0:640:cc76:ae35 with SMTP id
 4fb4d7f45d1cf-640cc76b080mr5601496a12.21.1762274646019; Tue, 04 Nov 2025
 08:44:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028174222.1739954-1-viswanathiyyappan@gmail.com>
 <20251028174222.1739954-2-viswanathiyyappan@gmail.com> <20251030192018.28dcd830@kernel.org>
In-Reply-To: <20251030192018.28dcd830@kernel.org>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Tue, 4 Nov 2025 22:13:49 +0530
X-Gm-Features: AWmQ_bmHt-lYY7oXmHpmE0c8MQd7N05CNjm8AaKyi8JrjM3k7rUlxmiFrNq3wMI
Message-ID: <CAPrAcgPD0ZPNPOivpX=69qC88-AAeW+Jy=oy-6+PP8jDxzNabA@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH net-next v3 1/2] net: Add ndo_write_rx_config and
 helper structs and functions:
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, sdf@fomichev.me, kuniyu@google.com, ahmed.zaki@intel.com, 
	aleksander.lobakin@intel.com, jacob.e.keller@intel.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	david.hunter.linux@gmail.com, khalid@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Oct 2025 at 07:50, Jakub Kicinski <kuba@kernel.org> wrote:

> pls make sure to prefix names of types and functions with netif,
> netdev or net

I think netif is the prefix that makes the most sense here. I will do that

> The driver you picked is relatively trivial, advanced drivers need
> to sync longer lists of mcast / ucast addresses. Bulk of the complexity
> is in keeping those lists. Simple
>
>         *rx_config = *(config_ptr);
>
> assignment is not enough.

Apologies, I had the wrong mental model of the snapshot.

From what I understand, the snapshot should look something like

struct netif_rx_config {
    char *uc_addrs; // of size uc_count * dev->addr_len
    char *mc_addrs; // of size mc_count * dev->addr_len
    int uc_count;
    int mc_count;
    bool multi_en, promisc_en, vlan_en;
    void *device_specific_config;
}
Correct me if I have missed anything

Does the following pseudocode/skeleton make sense?

update_config() will be called at end of set_rx_mode()

read_config() is execute_write_rx_config() and do_io() is
dev->netdev_ops->ndo_write_rx_config() named that way
for consistency (since read/update)

atomic_t cfg_in_use = ATOMIC_INIT(false);
atomic_t cfg_update_pending = ATOMIC_INIT(false);

struct netif_rx_config *active, *staged;

void update_config()
{
    int was_config_pending = atomic_xchg(&cfg_update_pending, false);

    // If prepare_config fails, it leaves staged untouched
    // So, we check for and apply if pending update
    int rc = prepare_config(&staged);
    if (rc && !was_config_pending)
        return;

    if (atomic_read(&cfg_in_use)) {
        atomic_set(&cfg_update_pending, true);
        return;
    }
    swap(active, staged);
}

void read_config()
{
    atomic_set(&cfg_in_use, true);
    do_io(active);
    atomic_set(&cfg_in_use, false);

    // To account for the edge case where update_config() is called
    // during the execution of read_config() and there are no subsequent
    // calls to update_config()
    if (atomic_xchg(&cfg_update_pending, false))
        swap(active, staged);
}

>The driver needs to know old and new entries
> and send ADD/DEL commands to FW. Converting virtio_net would be better,
> but it does one huge dump which is also not representative of most
> advanced NICs.

We can definitely do this in prepare_config()
Speaking of which, How big can uc_count and mc_count be?

Would krealloc(buffer, uc_count * dev->addr_len, GFP_ATOMIC) be a good idea?

Well, virtio-net does kmalloc((uc_count + mc_count) * ETH_ALEN) + ...,
GFP_ATOMIC),
so this shouldn't introduce any new failures for virtio-net

> Let's only allocate any extra state if driver has the NDO
> We need to shut down sooner, some time between ndo_stop and ndo_uninit

Would it make sense to move init (if ndo exists) and cleanup to
__dev_open and __dev_close?
