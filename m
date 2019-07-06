From: suratiamol@gmail.com (Amol Surati)
Date: Sat, 6 Jul 2019 12:28:07 +0530
Subject: [Linux-kernel-mentees] git: Behaviour of the stable-rc repo
Message-ID: <20190706065655.GA10163@arch>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190706065807.A0uQkJwn0Jkn3DkfdkZtmqq6weUdgPZ5RQpOG2GgBgU@z>

Hi,

Since yesterday, the stable-rc branch 'linux-5.1.y' has received new
commits.

There were 7 code-change-commits + 1 version-change-commit, which were
based on the released 5.1.16. Now, when the branch has been refreshed
(twice afaics) with new commits, those 8 previous commits have been assigned
new identities (still based on 5.1.16).

It seems that there are 3 copies of those 8 commits.
For e.g., the version-change-commit has these IDs -

57f5b343cdf9593b22d79f5261f30243c07d6515,
925bedf91c6bb194cb6b23a553cb8469f3a2007f, and
2b5fd394355ac0b2cc9572232727cb2bce7c15a7

with 2b5... being the most recent ID (and the HEAD iinm).

Could you help me understand how these copies are created, and why?

Also, why do we want to commit the version update, if more commits are
expected to arrive on top of it?

Thanks,
amol
