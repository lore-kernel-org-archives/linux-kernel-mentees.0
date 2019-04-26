From: bjorn.helgaas at gmail.com (Bjorn Helgaas)
Date: Fri, 26 Apr 2019 16:49:12 -0500
Subject: [Linux-kernel-mentees] [PATCH] Staging: sm750fb: Change *array
	into *const array
Message-ID: <CABhMZUVDALANGzvo6XftXgdPqkB_7WGU3=Jo=HqKUZXHzztprQ@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Kelsey,

These patches look good.  Since they're making exactly the same change
to two arrays, I would personally combine them into one patch.  If
there are others in the same file (or even in the same driver, if it
contains several files), I would do them all in the same patch.

Since they're all the same pattern, it's still easy to review them,
and combining them into a single patch cuts down on the git log
clutter.

Bjorn
